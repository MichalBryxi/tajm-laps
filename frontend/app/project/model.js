import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  description: DS.attr('string'),
  image: DS.attr('string'),
  hashtag: DS.attr('string'),
  latitude: DS.attr('number'),
  longitude: DS.attr('number'),

  posts: DS.hasMany('post', { async: true })
});
