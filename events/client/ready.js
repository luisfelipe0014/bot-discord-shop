module.exports = async(client) => {

  const avatares = [
    ]
  const atividades = [
    ["Meu prefixo é ! :D", "WATCHING"],
    ["Estou sendo desenvolvida pelo Felipe®#0800 esse lindo :3", "STREAMING"],
    ["Estou na versão Beta qualquer erro ou bug relate no Suporte", "WATCHING"],
    ["Meu Prefix é !", "LISTENING"],
    ["Em Desenvolvimento", "WATCHING"],
    ["Use o Comando !help", "WATCHING"],
    [`em ${bot.users.cache.size.toLocaleString()} servidores!", "STREAMING`]
    ]

     const status = [
      "online",
      "dnd",
      "idle"
    ];

    setInterval(async () => { // controlar o intervalo
      let i = Math.floor(Math.random() * atividades.length + 1) - 1
        await client.user.setActivity(atividades[i][0], { type: atividades [i][1], url: "https://www.twitch.tv/lender0"});
    }, 7000); // intervalo
  
    setInterval(async () => {
      let b = Math.floor(Math.random() * status.length + 1) - 1
        await client.user.setStatus(status[b])
    }, 20000)
  
    /*setInterval(async () => {
      let c = Math.floor(Math.random() * avatares.length + 1) - 1
        await client.user.setAvatar(avatares[c])
    }, 400000)*/

  client.logger.ready("   BOT CRIADO POR LENDER    ");
  console.log("-------------------------------");
  console.log(`[        BOT]: ${client.user.username} Esta Online!`);
  console.log(`[    Prefixo]: !`);
  console.log(`[ Servidores]: ${client.guilds.cache.size}`);
  console.log(`[     Canais]: ${client.channels.cache.size}`);
  console.log(`[   Usuarios]: ${client.users.cache.size}`);
  console.log(`[BOOT TIME]: ${process.uptime() * 1000}ms`);
}
