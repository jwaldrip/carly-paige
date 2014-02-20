STDOUT.sync = true

require 'bundler/setup'
Bundler.require(:default)

Flatrack.assets.append_path Bootstrap.stylesheets_path
Flatrack.assets.append_path Bootstrap.fonts_path
Flatrack.assets.append_path Bootstrap.javascripts_path