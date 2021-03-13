module.exports = {
  name: "say",
  description: "Get the bot to say what ever you want!",
  usage: "<msg>",
  run: async (bot, message, args) => {
    if (!message.member.permissions.has("ADMINISTRATOR")) return;
    let MSG = message.content.split(`${bot.prefix}say `).join("");
    if (!MSG)
      return message.channel.send(`Você não especificou sua mensagem para enviar!`);
    message.channel.send(MSG);
    message.delete();
  },
};
