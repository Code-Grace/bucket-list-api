'use strict';

const mongoose = require('mongoose');
// const uri = process.env.MONGOLAB_URI; || 'mongodb://127.0.0.1/bucket-list-api';
let uri;
if (process.env.NODE_ENV === 'production') {
  uri = process.env.MONGODB_URI;
} else {
  uri = 'mongodb://127.0.0.1/bucket-list-api';
}

mongoose.Promise = global.Promise;
mongoose.connect(uri);

module.exports = mongoose;
