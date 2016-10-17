'use strict';

const mongoose = require('mongoose');
const uri = process.env.MONGOLAB_URI || 'mongodb://127.0.0.1/bucket-list-api';
mongoose.Promise = global.Promise;
mongoose.connect(uri);

module.exports = mongoose;
