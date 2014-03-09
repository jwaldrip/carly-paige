$: << File.dirname(__FILE__)

STDOUT.sync = true

require 'bundler/setup'
Bundler.require(:default)

require 'includes/sass_functions'

# Ensure the cache dir exists
FileUtils.mkdir_p 'tmp/cache'
FileUtils.rm_rf 'tmp/cache/**'

Flatrack.config do |site|
  site.use Rack::Deflater
  site.use Rack::Cache,
           metastore:   'file:tmp/cache/rack/meta',
           entitystore: 'file:tmp/cache/rack/body'
  site.use Rack::Thumb
  site.assets.js_compressor  = :uglify if ENV['RACK_ENV'] == 'production'
  site.assets.css_compressor = :scss if ENV['RACK_ENV'] == 'production'
  site.assets.append_path 'assets/fonts'
  site.assets.append_path Bootstrap.stylesheets_path
  site.assets.append_path Bootstrap.fonts_path
  site.assets.append_path Bootstrap.javascripts_path
  site.assets.append_path Bower.environment.directory
end
