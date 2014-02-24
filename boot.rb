STDOUT.sync = true

require 'bundler/setup'
Bundler.require(:default)

module Sass::Script::Functions
  include Flatrack::AssetExtensions

  def sized_image(filename, width=nil, height=nil)
    raise ArgumentError, 'height or width must be provided' unless width || height
    # assert types
    assert_type filename, :String
    if width
      assert_type width, :Number
      width = width.to_s.chomp 'px'
    end

    if height
      assert_type height, :Number
      height = height.to_s.chomp 'px'
    end

    # compute size
    size      = [width, :x, height].join

    # Build Name
    filename  = unquote(filename).to_s
    extension = File.extname(filename)
    basename  = File.basename(filename, extension)
    new_name  = asset_path [basename, "_#{size}", extension].join

    # Finish
    Sass::Script::String.new(new_name)
  end

  declare :sized_image, :args => [:filename, :width, :height]

end

Flatrack.assets.js_compressor  = :uglify if ENV['RACK_ENV'] == 'production'
Flatrack.assets.css_compressor = :scss if ENV['RACK_ENV'] == 'production'
Flatrack.assets.append_path 'assets/fonts'
Flatrack.assets.append_path Bootstrap.stylesheets_path
Flatrack.assets.append_path Bootstrap.fonts_path
Flatrack.assets.append_path Bootstrap.javascripts_path
Flatrack.assets.append_path Bower.environment.directory