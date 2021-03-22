module.exports = {
  name: "backupmysql",
  description: "backup mysql",
  category: "moderation",
  usage: "backupmysql",
  run: async (bot, message, args) => {
   const mysqldump = require('mysqldump')
   const moment = require('moment')
   const { Client, MessageAttachment } = require('discord.js')
   if (!message.member.permissions.has("MANAGE_MESSAGES"))
   return message.channel.send(`Você não tem permissões suficientes!`);
    // dump the result straight to a file
    mysqldump({
        connection: {
            host: 'localhost',
            user: 'root',
            password: '',
            database: 'nolife',
        },
        dumpToFile: `./backups/backup_${moment().format('YYYY_MM_DD')}.sql`,
    });
  //   message.channel.send({
  //     files: [`./backups/backup_${moment().format('YYYY_MM_DD')}.sql`]
  // });
  const attachment = new MessageAttachment(`./backups/backup_${moment().format('YYYY_MM_DD')}.sql`);
    message.channel.send(`${message.author},`, attachment);
  },
};