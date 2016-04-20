import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('about');
  this.route('contact');

  this.route('projects');
  this.route('project', { path: '/project/:id' }, function() {
    this.route('description');
    this.route('map');
  });
});

export default Router;
