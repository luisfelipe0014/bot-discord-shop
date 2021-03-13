const warns = require("../../models/warns");
const { MessageEmbed } = require("discord.js");
module.exports = {
  name: "warns",
  description: "Get a user's warns in the guild!",
  category: "moderation",
  usage: "<User mention>",
  run: async (bot, message, args) => {
    let user = message.mentions.members.first();
    if (!user) return message.channel.send(`Nenhum usuário especificado!`);
    warns.find(
      { Guild: message.guild.id, User: user.id },
      async (err, data) => {
        if (err) console.log(err);
        if (!data.length)
          return message.channel.send(
            `${user.user.tag} não tem nenhum aviso nesta guilda!`
          );
        let Embed = new MessageEmbed()
          .setTitle(`${user.user.tag}'s warns em ${message.guild.name}.. `)
          .setDescription(
            data.map((d) => {
              return d.Warns.map(
                (w, i) =>
                  `${i + 1} - Moderator: ${
                    message.guild.members.cache.get(w.Moderator).user.tag
                  } Reason: ${w.Reason}`
              ).join("\n");
            })
          );
        message.channel.send(Embed);
      }
    );
  },
};
