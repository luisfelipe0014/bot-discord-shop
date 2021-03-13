const { MessageEmbed } = require("discord.js")
const { color } = require("../../config.json");

module.exports = {
  name: "stop",
  description: "Dar Stop a musica",
  run: (client, message, args) => {

    let embed = new MessageEmbed()
      .setColor(color);

    const { channel } = message.member.voice;

    if (!channel) {
      embed.setAuthor("Precisa estar num canal de voz.")
      return message.channel.send(embed);
    }

    const serverQueue = message.client.queue.get(message.guild.id);

    if (!serverQueue) {
      embed.setAuthor("Não esta tocando musica que eu pudesse parar")
      return message.channel.send(embed);
    }

    serverQueue.songs = [];
    serverQueue.connection.dispatcher.end();
  }
};
