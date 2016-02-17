require_relative '../utils'
require_relative '../base.rb'

module EmbedRb
  class Instagram
    include EmbedRb::Base

    def initialize(input, output, options, embeds)
      @input = input
      @output = output
      @embeds = embeds
      @options = options
      @regex = /(instagram.com\/p\/[a-zA-Z0-9_\/\?\-\=]+)/mi
    end

    private
    def render(url)
      dims = EmbedRb.get_dimensions(@options)
      return <<EOF
      <div class="ejs-embed ejs-instagram">
        <div class="ne-image-wrapper">
          <iframe src="#{EmbedRb.to_url(url.split('/?')[0])}/embed/" width="#{dims[:width]}" height="#{dims[:height]}" ></iframe>
        </div>
      </div>
EOF
    end
  end
end
