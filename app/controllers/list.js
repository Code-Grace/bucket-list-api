'use strict';

const controller = require('lib/wiring/controller');
const models = require('app/models');
const List = models.list;

const authenticate = require('./concerns/authenticate');

const index = (req, res, next) => {
  List.find()
    .then(lists => res.json({ lists }))
    .catch(err => next(err));
};

const show = (req, res, next) => {
  List.findById(req.params.id)
    .then(list => list ? res.json({ list }) : next())
    .catch(err => next(err));
};

const create = (req, res, next) => {
  let list = Object.assign(req.body.list, {
    _owner: req.currentUser._id,
  });
  List.create(list)
    .then(list => res.json({ list }))
    .catch(err => next(err));
};

const update = (req, res, next) => {
  let search = { _id: req.params.id, _owner: req.currentUser._id };
  List.findOne(search)
    .then(list => {
      if (!list) {
        return next();
      }

      delete req.body._owner;  // disallow owner reassignment.
      return list.update(req.body.list)
        .then(() => res.sendStatus(200));
    })
    .catch(err => next(err));
};

const destroy = (req, res, next) => {
  let search = { _id: req.params.id, _owner: req.currentUser._id };
  List.findOne(search)
    .then(list => {
      if (!list) {
        return next();
      }

      return list.remove()
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
  { method: authenticate, except: ['index', 'show'] },
], });
