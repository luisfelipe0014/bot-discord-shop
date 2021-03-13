const { MessageEmbed } = require("discord.js");
const ms = require("ms");
module.exports = {
  name: "giveaway",
  description: "Create a simple giveaway",
  usage: "<time> <channel> <prize>",
  category: "fun",
  run: async (bot, message, args) => {
    if (!args[0]) return message.channel.send(`Você não especificou seu tempo!`);
    if (
      !args[0].endsWith("d") &&
      !args[0].endsWith("h") &&
      !args[0].endsWith("m")
    )
      return message.channel.send(
        `Você não usou a formatação correta para a hora!`
      );
    if (isNaN(args[0][0])) return message.channel.send(`Isso não é um número!`);
    let channel = message.mentions.channels.first();
    if (!channel)
      return message.channel.send(
        `Não consegui encontrar esse canal!`
      );
    let prize = args.slice(2).join(" ");
    if (!prize) return message.channel.send(`Nenhum prêmio especificado!`);
    message.channel.send(`*Sorteio criado em ${channel}*`);
    let Embed = new MessageEmbed()
      .setTitle(`Novo Sorteio!`)
      .setDescription(
        `O usuário ${message.author} está hospedando um sorteio com o prêmio de ** ${award} **`
      )
      .setTimestamp(Date.now() + ms(args[0]))
      .setColor(`BLUE`);
    let m = await channel.send(Embed);
    m.react("🎉");
    setTimeout(() => {
      if (m.reactions.cache.get("🎉").count <= 1) {
        message.channel.send(`Reactions: ${m.reactions.cache.get("🎉").count}`);
        return message.channel.send(
          `Não houve pessoas suficientes para que eu Anunciasse o Ganhador!`
        );
      }

      let winner = m.reactions.cache
        .get("🎉")
        .users.cache.filter((u) => !u.bot)
        .random();
      channel.send(
        `O vencedor do sorteio para **${prize}** é... ${winner}`
      );
    }, ms(args[0]));
  },
};
