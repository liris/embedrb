require_relative 'embed_url'
require_relative 'embed_gmap'
require_relative 'embed_open_graph'
require_relative 'image/embed_images.rb'
require_relative 'image/embed_flickr.rb'
require_relative 'image/embed_instagram.rb'
require_relative 'video/embed_video'
require_relative 'video/embed_ted'
require_relative 'video/embed_ustream'
require_relative 'video/embed_youtube'
require_relative 'audio/embed_audio'
require_relative 'utils'

PROCESSORS = {
  :link => EmbedRb::Url,
  :gmap => EmbedRb::Gmap,
  :video => EmbedRb::BasicVideo,
  :youtube => EmbedRb::YouTube,
  :ted => EmbedRb::Ted,
  :ustream => EmbedRb::Ustream,
  :image => EmbedRb::BasicImage,
  :flickr => EmbedRb::Flickr,
  :instagram => EmbedRb::Instagram,
  :audio => EmbedRb::BasicAudio,
  :openGraphEndpoint => EmbedRb::OpenGraph,
}

DEFAULT_OPTIONS = {
  :link => true,
  :linkOptions => {
    :target => 'self',
    :exclude => ['pdf'],
    :rel => '',
  },

  :openGraphEndpoint => nil, # http://opengraph.io/api/1.0/site/${url_encoded_site_url}
  :openGraphOptions => {
    :apiKey => nil,
    :excluded_regex => nil,
  },

  :gmap => false,
  :gmapOptions => {
    :mode => 'place',
    :googleAuthKey => nil,
  },

  :video => true,

  :youtube => true,
  :youtubeOptions => {
  },

  :ted => true,
  :ustream => false,

  :image => true,
  :flickr => true,
  :instagram => true,

  :audio => true,

}

module EmbedRb
  class Embed
    def initialize(options, input)
      @options = EmbedRb.deep_merge(DEFAULT_OPTIONS, options)
      @options[:served] = []
      @input = input
    end

    def process()
      input = @input
      embeds = []
      output = ''

      PROCESSORS.each {|key, klass|
        if @options[key]
          output = klass.new(input, output, @options, embeds).process()
        end
      }

      EmbedRb.create_text(output, embeds)
    end
  end
end
