const { MessageEmbed } = require("discord.js");
const api = require("imageapi.js");
module.exports = {
  name: "meme",
  description: "Get a meme!",
  category: "fun",
  timeout: 5000,
  run: async (bot, message, args) => {
    let subreddits = ["comedyheaven", "dank", "meme", "memes"];
    let subreddit =
      subreddits[Math.floor(Math.random() * subreddits.length)];
    let img = await api(subreddit, true);
    const Embed = new MessageEmbed()
      .setTitle(`Um meme de r/${subreddit}`)
      .setURL(`https://reddit.com/r/${subreddit}`)
      .setColor("RANDOM")
      .setImage(img);
    message.channel.send(Embed);
  },
};
