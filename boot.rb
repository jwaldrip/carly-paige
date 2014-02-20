STDOUT.sync = true

require 'bundler/setup'
Bundler.require(:default)

FlatRack.assets.append_path Bootstrap.stylesheets_path
FlatRack.assets.append_path Bootstrap.fonts_path
FlatRack.assets.append_path Bootstrap.javascripts_path