const custom = require("../../models/custom");
module.exports = {
  name: "cc",
  description: "Create a custom command",
  category: "config",
  timeout: 5000,
  aliases: ["custom"],
  run: async (bot, message, args) => {
    if (!message.member.permissions.has("MANAGE_MESSAGES"))
      return message.channel.send(`Você não tem permissões suficientes!`);
    if (!args[0])
      return message.channel.send(`Você não especificou o nome de comando!`);
    if (!args.slice(1).join(" "))
      return message.channel.send(`Nenhum conteúdo especificado!`);
    custom.findOne(
      { Guild: message.guild.id, Command: args[0] },
      async (err, data) => {
        if (err) throw err;
        if (data) {
          data.Content = args.slice(1).join(" ");
          data.save();

          message.channel.send(
            `Comando atualizado com sucesso \`${args[0]}\``
          );
        } else if (!data) {
          let newData = new custom({
            Guild: message.guild.id,
            Command: args[0],
            Content: args.slice(1).join(" "),
          });
          newData.save();
          message.channel.send(
            `Comando criado com sucesso \`${args[0]}\``
          );
        }
      }
    );
  },
};
