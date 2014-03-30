module LinkHelper
  include Flatrack::View::LinkHelper

  FACEBOOK  = '#facebook'
  ITUNES    = '#itunes'
  TWITTER   = '#twitter'
  YOUTUBE   = '#you_tube'
  GPLUS     = '#google_plus'
  INSTAGRAM = '#instagram'

  def facebook_link(content = nil, &block)
    link_to *[content, FACEBOOK].compact, &block
  end

  def itunes_link(content = nil, &block)
    link_to *[content, ITUNES].compact, &block
  end

  def twitter_link(content = nil, &block)
    link_to *[content, TWITTER].compact, &block
  end

  def youtube_link(content = nil, &block)
    link_to *[content, YOUTUBE].compact, &block
  end

  def gplus_link(content = nil, &block)
    link_to *[content, GPLUS].compact, &block
  end

  def instagram_link(content = nil, &block)
    link_to *[content, INSTAGRAM].compact, &block
  end

end