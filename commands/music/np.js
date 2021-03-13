const { MessageEmbed } = require("discord.js")
const { color } = require("../../config.json");

module.exports = {
  name: "np",
  description: "Recolhe o nome da musica que esta a dar",
  run: (client, message, args) => {
    let embed = new MessageEmbed()
      .setColor(color)

    const { channel } = message.member.voice;
    if (!channel) {
      embed.setAuthor("Precisa estar num canal de voz")
      return message.channel.send(embed);
    }

    const serverQueue = message.client.queue.get(message.guild.id);

    if (!serverQueue) {
      embed.setAuthor("Não estou a reproduzir nada!")
      return message.channel.send(embed);
    }

    embed.setDescription(`**A TOCAR AGORA** - \`${serverQueue.songs[0].title}\``)
      .setThumbnail(serverQueue.songs[0].thumbnail)
    message.channel.send(embed)
  }
}