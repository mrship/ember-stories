App.StoryListComponent = Ember.Component.extend
  empty   : ( () -> 
    @get('list.content.length') is 0
  ).property('list.length')

  text    : ''
  actions : 
    show: (story) -> 
      @set('text', story.get('text'))

    "delete": (story) -> 
      @set('text', '')
      story.deleteRecord()
      story.save()
