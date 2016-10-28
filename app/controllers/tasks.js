'use strict';

const controller = require('lib/wiring/controller');
const models = require('app/models');
const Task = models.task;
//const mongoose = require('mongoose');

const authenticate = require('./concerns/authenticate');

const index = (req, res, next) => {
  Task.find({ _owner: req.currentUser._id })
    .then((tasks) => {
      return res.json({ tasks });
    })
    .catch(err => next(err));
};

const show = (req, res, next) => {
  let search = { _id: req.params.id, _owner: req.currentUser._id };
  Task.findById(search)
    .then(tasks => tasks ? res.json({ tasks }) : next())
    .catch(err => next(err));
};

const create = (req, res, next) => {
  let tasks = Object.assign(req.body.tasks, {
    _owner: req.currentUser._id,
  });
  Task.create(tasks)
    .then(tasks => res.json({ tasks }))
    .catch(err => next(err));
};

const update = (req, res, next) => {
  let search = { _id: req.params.id, _owner: req.currentUser._id };
  Task.findOne(search)
    .then(tasks => {
      if (!tasks) {
        return next();
      }

      delete req.body._owner;  // disallow owner reassignment.
      return tasks.update(req.body.tasks)
        .then(() => res.sendStatus(200));
    })
    .catch(err => next(err));
};

const destroy = (req, res, next) => {
  let search = { _id: req.params.id, _owner: req.currentUser._id };
  Task.findOne(search)
    .then(tasks => {
      if (!tasks) {
        return next();
      }

      return tasks.remove()
        .then(() => res.sendStatus(200));
    })
    .catch(err => next(err));
};

module.exports = controller({
  index,
  show,
  create,
  update,
  destroy,
}, { before: [
  { method: authenticate },
], });
