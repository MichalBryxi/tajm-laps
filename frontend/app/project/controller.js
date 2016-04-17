import Ember from 'ember';
import { linkify } from 'ember-linkify/helpers/linkify';
import moment from 'moment';

export default Ember.Controller.extend({
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
