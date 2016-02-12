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
require_relative 'utils'

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
  :ustream => true,

  :image => true,
  :flickr => true,
  :instagram => true,

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

      if @options[:link]
        output = EmbedRb::Url.new(input, output, @options, embeds).process()
      end

      if @options[:openGraphEndpoint]
        output = EmbedRb::OpenGraph.new(input, output, @options, embeds).process()
      end

      if @options[:gmap]
        output = EmbedRb::Gmap.new(input, output, @options, embeds).process()
      end

      if @options[:video]
        output = EmbedRb::BasicVideo.new(input, output, @options, embeds).process()
      end

      if @options[:youtube]
        output = EmbedRb::YouTube.new(input, output, @options, embeds).process()
      end

      if @options[:ted]
        output = EmbedRb::Ted.new(input, output, @options, embeds).process()
      end

      if @options[:ustream]
        output = EmbedRb::Ustream.new(input, output, @options, embeds).process()
      end

      if @options[:image]
        output = EmbedRb::BasicImage.new(input, output, @options, embeds).process()
      end

      if @options[:flickr]
        output = EmbedRb::Flickr.new(input, output, @options, embeds).process()
      end

      if @options[:instagram]
        output = EmbedRb::Instagram.new(input, output, @options, embeds).process()
      end

      EmbedRb.create_text(output, embeds)
    end
  end
end



input = <<EOF
hoge https://www.youtube.com/watch?v=wF_3Rp8oe1M done
 http://www.google.com/
 the following is geocode
 @(東京駅)
 http://hoge.fuga.com/xxx/yyy.png
 https://www.flickr.com/photos/parismadrid/5573484679/in/photolist-9uvyPr-7TD5uZ-jYwbo8-qeZLRe-odzeYC-n8x6Xn-dzq2Ws-oRNMGp-68DxGi-c4DxV7-bnmwjN-nqZDVD-kF39se-rXJWT4-nTTR4S-7YLgdX-apPuvi-q1DhYc-kFWFjG-a2c9kr-aPGmhK-oqB5cQ-ziBGRr-oBkGxp-pEFgd8-jY9diK-mDTbpD-jzSaXQ-cuCWwN-pzK88U-9HvHVt-dBPTZV-nKdYRM-oEDGkL-bTygzn-o3CxjL-rhtanH-oXpW1i-s4Jdat-p8N1RJ-fhpghZ-dX2tPC-v8R2LX-x7M7j1-xFACNe-cAWLSf-A6FvqE-adcNyU-t2N6Hh-j1TaxV

 https://www.instagram.com/p/BBmsYJesuYH/?tagged=beach
 https://hoge.fuga.com/video.mp4

 https://ted.com/talks/sometalk
 http://www.ustream.tv/channel/%E3%81%AC%E3%81%93%E3%81%AE%E3%81%93
 http://www.ustream.tv/embed/5832768?html5ui

 ---------------------
EOF
opts = {
#  :openGraphEndpoint => 'http://opengraph.io/api/1.0/site/',
  :gmap => true,
  :gmapOptions => {
    :googleAuthKey => ENV['GOOGLE_AUTH_KEY'],
    :mode => 'streetview'
  },
}
embed = EmbedRb::Embed.new(opts, input)
print(embed.process)
