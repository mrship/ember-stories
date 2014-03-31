App.StoriesNewController = Ember.ObjectController.extend
  actions:
    save: -> 
      story = 
        @get('store').createRecord('story', 
          title: @get('title')
          text: @get('text')
        )
      story.save().then( => @transitionToRoute('stories.index') )

    cancel: -> @transitionToRoute('stories.index')

App.StoryEditController = Ember.ObjectController.extend
  story: ( () -> @get('content.content') ).property('content.content')

  storyDeleted: ( () -> 
    @transitionToRoute('stories.index') if @get('story.isDeleted') 
  ).observes('story.isDeleted').on('init')

  actions:
    update: -> 
      @get('story').setProperties
        title: @get('title')
        text: @get('text')
      @get('story').save().then( => @transitionToRoute('stories.index') )

    cancel: -> 
      @get('story').rollback()
      @transitionToRoute('stories.index')
