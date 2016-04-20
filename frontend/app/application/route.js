import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    setFullscreen(arg) {
      this.controllerFor('application').set('isFullScreen', arg);
    }
  }
});
