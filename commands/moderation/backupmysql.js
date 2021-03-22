var db_name = 'FXServerDEV'
var db_user = 'root'
var db_password = ''

module.exports = {
  name: "backupmysql",
  description: "backup mysql",
  category: "moderation",
  usage: "backupmysql",
  run: async (bot, message, args) => {
    const cron = require('node-cron')
    const moment = require('moment')
    const fs = require('fs')
    const spawn = require('child_process').spawn

    // You can adjust the backup frequency as you like, this case will run once a day
    cron.schedule('0 0 * * *', () => {
    // Use moment.js or any other way to dynamically generate file name
      const fileName = `${db_name}_${moment().format('YYYY_MM_DD')}.sql`
      const wstream = fs.createWriteStream(`/Path/You/Want/To/Save/${fileName}`)
      console.log('---------------------')
      console.log('Running Database Backup Cron Job')
      const mysqldump = spawn('mysqldump', [ '-u', db_user, `-p${db_password}`, db_name ])

      mysqldump
        .stdout
        .pipe(wstream)
        .on('finish', () => {
          console.log('DB Backup Completed!')
        })
        .on('error', (err) => {
          console.log(err)
        })
    })
  },
};
