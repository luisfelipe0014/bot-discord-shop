
const mongoose = require('mongoose');

const Schema = new mongoose.Schema({
    Prefix: {
        type: String
    },
    GuildID: String
});
