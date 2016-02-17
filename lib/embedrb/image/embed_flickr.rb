require_relative '../utils'
require_relative '../base.rb'

module EmbedRb
  class Flickr
    include EmbedRb::Base

    def initialize(input, output, options, embeds)
      @input = input
      @output = output
      @embeds = embeds
      @options = options
      @regex = /(flickr.com\/[a-z]+\/[a-zA-Z0-9@_\-]+\/[\d]+)/mi
    end

    private
    def render(url)
      dims = EmbedRb.get_dimensions(@options)
      return <<EOF
      <div class="ejs-embed">
        <div class="ne-image-wrapper">
          <iframe src="#{EmbedRb.to_url(url.split('/?')[0])}/player/" width="#{dims[:width]}" height="#{dims[:height]}" ></iframe>
        </div>
      </div>
EOF
    end
  end
end
