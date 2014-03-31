App.Router.map -> 
  @resource 'stories', ->
    @route 'new'
    @resource 'story', path: '/:story_id', ->
      @route 'edit'


App.IndexRoute = Ember.Route.extend
  afterModel : -> @transitionTo('stories.index')
  
App.StoriesIndexRoute = Ember.Route.extend
  model : -> @get('store').find('story')

App.StoriesNewRoute = Ember.Route.extend
  model : -> 
    store = @get('store')
    new Ember.RSVP.Promise((resolve, reject) ->
      _o = new Em.ObjectProxy()
      _o.setProperties
        content: new Em.Object()
        allStories: store.find('story')
      resolve(_o)
    )

App.StoryEditRoute = Ember.Route.extend
  model : (params) -> 
    stories = @get('store').find('story')
    story   = @modelFor('story')
    new Ember.RSVP.Promise((resolve, reject) ->
      _o = new Em.ObjectProxy()
      _o.setProperties
        content: story
        allStories: stories
      resolve(_o)
    )
