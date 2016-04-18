import Ember from 'ember';
import { linkify } from 'ember-linkify/helpers/linkify';
import moment from 'moment';

export default Ember.Controller.extend({
  i18n: Ember.inject.service(),

  tabs: Ember.computed(function () {
    return [
      { id: 'description', title: this.get('i18n').t('project.description') },
      { id: 'map', title: this.get('i18n').t('project.map') }
    ];
  }),
  selectedTab: 'description',

  showMap: Ember.computed('selectedTab', function() {
    return this.get('selectedTab') === 'map';
  }),

  showDescription: Ember.computed('selectedTab', function() {
    return this.get('selectedTab') === 'description';
  }),

  photos: Ember.computed.map('model.posts', function(post) {
    let date = moment(post.get('createdAt')).format('DD.MM.');
    let body = linkify(post.getWithDefault('body', ''));

    let title = `${date} - ${body}`;
    let w = 600;
    let h = 338;
    let src = post.get('image');
    let createdAt = post.get('createdAt');

    return { src, w, h, title, createdAt };
  }),

  photosSorted: Ember.computed.sort('photos', (a, b) => {
    return a.createdAt < b.createdAt;
  })
});
