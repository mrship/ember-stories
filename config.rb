Dotenv.load

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :ember
activate :livereload

set :layout, nil

activate :s3_sync do |s3_sync|
  s3_sync.bucket                = ENV['S3_BUCKET']
  s3_sync.region                = 'eu-west-1'
  s3_sync.aws_access_key_id     = ENV['ACCESS_KEY']
  s3_sync.aws_secret_access_key = ENV['SECRET_KEY']
  s3_sync.delete                = true
  s3_sync.after_build           = true
  s3_sync.prefer_gzip           = false
end

configure :build do
  set :ember_variant, :production

  activate :minify_css
  activate :minify_javascript
  activate :asset_hash

  %w[
    routes
    models
    controllers
    components
  ].each do |to_ignore|
    ignore "#{js_dir}/#{to_ignore}*"  
  end

  ignore "#{css_dir}/scss*"  
  ignore "#{js_dir}/boot.js.coffee"
end

after_configuration do
  caching_policy 'text/html', max_age: 0, must_revalidate: true
  default_caching_policy      max_age: 60 * 60 * 24 * 365
end
