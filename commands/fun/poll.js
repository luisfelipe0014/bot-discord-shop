const Discord = require("discord.js");
module.exports = {
  name: "poll",
  description: "Create a simple yes or no poll",
  category: "fun",
  run: async (bot, message, args) => {
    if (!message.member.permissions.has("ADMINISTRATOR"))
      return message.channel.send(
        `Você não tem administrador, ${message.author.username}`
      );
    const channel =
      message.mentions.channels.first() ||
      message.guild.channels.cache.get(args[0]);
    if (!channel) {
      return message.channel.send(
        `Você não mencionou /  id do seu canal!`
      );
    }
    let question = message.content
      .split(`${bot.prefix}poll ${channel} `)
      .join("");
    if (!question)
      return message.channel.send(`Você não especificou sua pergunta!`);
    const Embed = new Discord.MessageEmbed()
      .setTitle(`Nova votação!`)
      .setDescription(`${question}`)
      .setFooter(`${message.author.username} criou esta enquete.`)
      .setColor(`RANDOM`);
    let msg = await bot.channels.cache.get(channel.id).send(Embed);
    await msg.react("👍");
    await msg.react("👎");
  },
};
