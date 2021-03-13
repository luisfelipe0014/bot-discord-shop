const { MessageEmbed } = require("discord.js");
module.exports = async (oldMessage, newMessage) => {
  try {
    let embed = new MessageEmbed()
      .setTitle(`Nova Mensagem Editada`)
      .setColor(`GREEN`)
      .setDescription(
        `**Usuario ${oldMessage.author.tag} Canal <#${oldMessage.channel.id}>**`
      )
      .addField(`Antes`, oldMessage.content, true)
      .addField(`Depois`, newMessage.content, true);
    let channel = oldMessage.guild.channels.cache.find(
      (ch) => ch.name === "bot-log"
    );
    if (!channel) return;
    channel.send(embed);
  } catch (e) {}
};
