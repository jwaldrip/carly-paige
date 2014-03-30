require 'faraday'
require 'faraday_middleware'
require 'active_support/all'
require 'json'

module InstagramHelper

  USER_NAME    = 'carlypaigemusic414'
  ACCESS_TOKEN = '2278601.1fb234f.5eb0d9ae03854cfaa04393f69e4ac98a'

  class << self

    delegate :connection, to: :client

    def connection
      @connection ||= Faraday.new('https://api.instagram.com') do |conn|
        conn.response :json, :content_type => /\bjson$/
        conn.response :follow_redirects
        conn.use FaradayMiddleware::RackCompatible, Rack::Cache::Context,
                 metastore:      'file:tmp/cache/rack/meta',
                 entitystore:    'file:tmp/cache/rack/body',
                 ignore_headers: %w{Set-Cookie X-Content-Digest}

        conn.adapter Faraday.default_adapter
      end
    end

    def get(path, params={})
      connection.get do |req|
        req.path                  = path
        req.headers['Accept']     = 'application/json'
        req.params                = params
        req.params[:access_token] = ACCESS_TOKEN
      end.body
    end

  end

  def get_media
    InstagramHelper.get("v1//users/#{user_id}/media/recent")['data'].map do |media|
      OpenStruct.new.tap do |struct|
        struct.caption = media['caption']['text']
        struct.link    = media['link']
        media['images'].each do |name, data|
          struct.send "#{name}=", data['url']
        end
      end
    end
  end

  def user_id
    InstagramHelper.get("v1/users/search", q: USER_NAME)['data'].first['id']
  end

end