const { MessageEmbed } = require("discord.js");
let questions = [
  {
    title: "Melhor linguagem de programação",
    options: ["JavaScript/TypeScript", "Python", "Ruby", "Rust"],
    correct: 1,
  },
  {
    title: "Melhor NPM package",
    options: ["int.engine", "ms", "ws", "discord.js"],
    correct: 3,
  },
];
module.exports = {
  name: "trivia",
  description: "Test your knowledge!",
  category: "fun",
  run: async (bot, message, args) => {
    let q = questions[Math.floor(Math.random() * questions.length)];
    let i = 0;
    const Embed = new MessageEmbed()
      .setTitle(q.title)
      .setDescription(
        q.options.map((opt) => {
          i++;
          return `${i} - ${opt}\n`;
        })
      )
      .setColor(`GREEN`)
      .setFooter(
        `Responda a esta mensagem com o número correto da pergunta! Você tem 15 segundos.`
      );
    message.channel.send(Embed);
    try {
      let msgs = await message.channel.awaitMessages(
        (u2) => u2.author.id === message.author.id,
        { time: 15000, max: 1, errors: ["time"] }
      );
      if (parseInt(msgs.first().content) == q.correct) {
        return message.channel.send(`Você acertou!`);
      } else {
        return message.channel.send(`Você entendeu errado.`);
      }
    } catch (e) {
      return message.channel.send(`Você não respondeu!`);
    }
  },
};
