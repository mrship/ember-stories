# Ember Stories

* This is a simple website to show some of the concepts behind an [EmberJS](http://emberjs.com/) app. 
* There's a live example at http://stories.cllearview.com.
* It uses the [Local Storage Adapater](https://github.com/rpflorence/ember-localstorage-adapter) and [Ember Data](https://github.com/emberjs/data) to store a story title and text locally in the browser.
* To learn more about how this works with a Rails backend, it's worth watching Yehuda Katz's [talk at Rails Israel](http://lanyrd.com/2013/railsisrael/scpwcc/)

### Installation

It's built using [Middleman](http://middlemanapp.com/) and can be run locally by:

1. Install dependencies with `bundle`
2. Run `middleman serve` and navigate to `http://localhost:4567`

To build a deployable version, use `middleman build`. By default this will try to deploy to an S3 bucket using `S3_BUCKET`, `ACCESS_KEY` and `SECRET_KEY` environment vars. These can be set by adding a .env file to your repo.
