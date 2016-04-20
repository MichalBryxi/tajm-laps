import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    didTransition: function() {
      this.send('setFullscreen', true);
      return true;
    },
    willTransition: function() {
      this.send('setFullscreen', false);
      return true;
    }
  }
});
