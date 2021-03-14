const Discord = require("discord.js");
const fs = require("fs");
const confi = require("./config.json");
const prefix = confi.prefix;
const config = require('dotenv').config()
const bot = new Discord.Client({
  disableMentions: "everyone",
  partials: ["REACTION"],
});
bot.queue = new Map();
bot.vote = new Map();
bot.prefix = prefix;
bot.commands = new Discord.Collection();
bot.aliases = new Discord.Collection();
bot.snipes = new Discord.Collection();
bot.events = new Discord.Collection();
bot.categories = fs.readdirSync("./commands/");

const mongoose = require('mongoose');
const setprefix = require('./models/prefix');

mongoose.connect('mongodb+srv://luis0014:luis0014@cluster0.jqrnx.gcp.mongodb.net/luis0014?retryWrites=true&w=majority', { 
    useNewUrlParser: true,
    useFindAndModify: false,
    useUnifiedTopology: true,
    useCreateIndex: true
});

mongoose.connection.on("connected", () => {
  console.log("Mongoose has successfully connected!");
});
mongoose.connection.on("err", err => {
  console.error(`Mongoose connection error: \n${err.stack}`);
});
mongoose.connection.on("disconnected", () => {
  console.warn("Mongoose connection lost");
});

["command", "server"].forEach((handler) => {
  require(`./handlers/${handler}`)(bot, prefix);
});

bot.on("ready", async () => {
  require("./events/client/ready")(bot);
});

bot.on("message", async (message) => {
  require("./events/guild/message")(bot, message);
});

bot.on("messageUpdate", async (oldMessage, newMessage) => {
  require("./events/guild/messageUpdate")(oldMessage, newMessage);
});

bot.on("messageDelete", async (message) => {
  require("./events/guild/messageDelete")(message);
});

bot.on("messageReactionAdd", (reaction, user) => {
  require("./events/guild/messageReactionAdd")(reaction, user);
});

bot.on("messageReactionRemove", (reaction, user) => {
  require("./events/guild/messageReactionRemove")(reaction, user);
});

bot.login(process.env.BOT_TOKEN);


