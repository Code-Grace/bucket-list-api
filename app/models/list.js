'use strict';

const mongoose = require('mongoose');

const listSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true,
  },
  completed: {
    type: Boolean,
    required: true,
  },
  user_id: {
    type: Number,
    required: true,
  },
}, {
  timestamps: true,
  toJSON: { virtuals: true },
});

listSchema.virtual('length').get(function length() {
  return this.text.length;
});

const List = mongoose.model('List', listSchema);

module.exports = List;
