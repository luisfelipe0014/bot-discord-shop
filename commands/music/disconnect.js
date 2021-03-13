const { MessageEmbed } = require("discord.js")
const { color, title, footertext, footerimage } = require('../../config.json');

module.exports = {
  name: "disconnect",
  description: "Get the detailed information of bot",
  run: (client, message, args) => {
    let embed = new MessageEmbed()
      .setColor(color);

    console.log(client.queue.size)
    if (!message.member.voice.channel) {
      embed.setAuthor("Precisa estar num canal de voz.")
      return message.channel.send(embed);
    }
    const serverQueue = message.client.queue.get(message.guild.id);

    if (!serverQueue) return message.channel.send("Não estou a reproduzir nada para que eu possa dar **\`disconnect\`**.");
    serverQueue.songs = [];
    serverQueue.connection.dispatcher.end("**O comando de Stop foi usado!**"); {
      embed.setDescription("**🔇  |  Comando \`disconnect\` foi usado!**")
      return message.channel.send(embed);
    }
  }
};
