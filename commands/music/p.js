const { MessageEmbed } = require("discord.js")
const ms = require("ms")
const { YOUTUBE_API_KEY, QUEUE_LIMIT, color, footertext, footerimage, title } = require("../../config.json");
const ytdl = require("ytdl-core");
const YoutubeAPI = require("simple-youtube-api");
const youtube = new YoutubeAPI(YOUTUBE_API_KEY);
const { play } = require("../../models/music.js");

module.exports = {
  name: "play",
  aliases: ["p"],
  description: "Play the song and feel the music",
  timeout: "5000",
  run: async (client, message, args) => {
    let embed = new MessageEmbed()
      .setColor(color);

    if (!args.length) {
      embed.setAuthor("Erro no Syntax : Escreve `play <URL> ou o nome da música")
      return message.channel.send(embed);
    }

    const { channel } = message.member.voice;

    if (!channel) {
      embed.setAuthor("Precisa estar num canal de voz")
      return message.channel.send(embed);
    }

    const targetsong = args.join(" ");
    const videoPattern = /^(https?:\/\/)?(www\.)?(youtube\.com|youtu\.?be)\/.+$/gi;
    const playlistPattern = /^.*(youtu.be\/|list=)([^#\&\?]*).*/gi;
    const urlcheck = videoPattern.test(args[0]);

    if (!videoPattern.test(args[0]) && playlistPattern.test(args[0])) {
      embed.setAuthor("Não consigo reproduzir a lista de reprodução por enquanto")
      return message.channel.send(embed);
    }

    const serverQueue = message.client.queue.get(message.guild.id);

    const queueConstruct = {
      textChannel: message.channel,
      channel,
      connection: null,
      songs: [],
      loop: false,
      volume: 100,
      playing: true
    };

    const voteConstruct = {
      vote: 0,
      voters: []
    }

    let songData = null;
    let song = null;

    if (urlcheck) {
      try {
        songData = await ytdl.getInfo(args[0]);

        song = {
          title: songData.videoDetails.title,
          url: songData.videoDetails.video_url,
          duration: songData.videoDetails.lengthSeconds,
          thumbnail: songData.videoDetails.thumbnail.thumbnails[3].url
        };
      } catch (error) {
        if (message.include === "copyright") {
          return message
            .reply("O video tem \`Copyright\`.")
            .catch(console.error);
        } else {
          console.error(error);
        }
      }
    } else {

      try {
        const result = await youtube.searchVideos(targetsong, 1);
        songData = await ytdl.getInfo(result[0].url);

        song = {
          title: songData.videoDetails.title,
          url: songData.videoDetails.video_url,
          duration: songData.videoDetails.lengthSeconds,
          thumbnail: songData.videoDetails.thumbnail.thumbnails[3].url,
        };
      } catch (error) {
        console.log(error)
        if (error.errors[0].domain === "usageLimits") {
          return message.channel.send("Seu limite de API do YT acabou e será restaurado em 24 horas")
        }
      }
    }

    if (serverQueue) {
      if (serverQueue.songs.length > Math.floor(QUEUE_LIMIT - 1) && QUEUE_LIMIT !== 0) {
        return message.channel.send(`Você não pode adicionar músicas com mais de ${QUEUE_LIMIT} na fila`)
      }

      serverQueue.songs.push(song);
      embed.setDescription(`**[${song.title}](${song.url})**`)
      embed.setThumbnail(song.thumbnail)
        .setFooter(`Likes - ${songData.videoDetails.likes} | Dislikes - ${songData.videoDetails.dislikes}`)

      return serverQueue.textChannel
        .send(embed)
        .catch(console.error);
    } else {
      queueConstruct.songs.push(song);
    }

    if (!serverQueue)
      message.client.queue.set(message.guild.id, queueConstruct);
    message.client.vote.set(message.guild.id, voteConstruct);
    if (!serverQueue) {
      try {
        queueConstruct.connection = await channel.join();
        play(queueConstruct.songs[0], message);
      } catch (error) {
        console.error(`Não foi possível entrar no canal: ${error}`);
        message.client.queue.delete(message.guild.id);
        await channel.leave();
        return message.channel
          .send({
            embed: {
              description: `😭 | Não foi possível entrar no canal: ${error}`,
              color: COLOR
            }
          })
          .catch(console.error);
      }
    }
  }
};
