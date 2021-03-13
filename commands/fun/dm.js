module.exports = {
  name: "dm",
  description: "DM a user in the guild",
  ncategory: "fun",
  run: async (bot, message, args) => {
    if (!message.member.permissions.has("MANAGE_MESSAGES"))
      return message.channel.send("Você não tem permissões suficientes!");
    let user =
      message.mentions.members.first() ||
      message.guild.members.cache.get(args[0]);
    if (!user)
      return message.channel.send(
        `Você não mencionou um usuário ou forneceu uma id valida`
      );
    if (!args.slice(1).join(" "))
      return message.channel.send("Você não especificou sua mensagem");
    user.user
      .send(args.slice(1).join(" "))
      .catch(() => message.channel.send("Esse usuário não pôde ser DMed!"))
      .then(() => message.channel.send(`Enviou uma mensagem para ${user.user.tag}`));
  },
};
