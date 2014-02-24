require './boot'
require 'rack/cache'

# Clear the cache before starting
FileUtils.mkdir_p 'tmp/cache'
ActiveSupport::Cache.lookup_store(:file_store, 'tmp/cache').clear

use Rack::Deflater
use Rack::Cache,
    metastore:   'file:tmp/cache/rack/meta',
    entitystore: 'file:tmp/cache/rack/body'
use Rack::Thumb
run Flatrack::Site