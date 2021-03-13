const { MessageEmbed } = require("discord.js");
const { title, color, footertext, footerimage } = require('../../config.json');

module.exports = {
  name: "announce",
  description: "Faça o bot dizer o que você quiser em um canal específico.",
  usage: "<channel id> <msg>",
  run: async (bot, message, args) => {
    let rChannel = message.guild.channels.cache.get(args[0]);
    if (!rChannel)
      return message.channel.send(
        `Você não especificou seu canal para enviar o anúncio também!`
      );
    console.log(rChannel);
    let MSG = message.content
      .split(`${bot.prefix}announce ${rChannel.id} `)
      .join("");
    if (!MSG)
      return message.channel.send(`Você não especificou sua mensagem para enviar!`);
    const _ = new MessageEmbed()
      .setTitle(`Novo Anuncio!`)
      .setDescription(`${MSG}`)
      .setColor("RANDOM");
    rChannel.send(_);
    message.delete();
  },
};
