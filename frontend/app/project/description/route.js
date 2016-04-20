import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    let { id } = this.paramsFor('project');
    return this.store.findRecord('project', id);
  }
});
