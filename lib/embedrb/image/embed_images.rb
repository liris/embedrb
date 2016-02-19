require_relative '../utils'
require_relative '../base.rb'

module EmbedRb
  class BasicImage
    include EmbedRb::Base

    def initialize(input, output, options, embeds)
      @input = input
      @output = output
      @embeds = embeds
      @options = options
      @regex = /((?:https?):\/\/\S*\.(?:gif|jpg|jpeg|tiff|png|svg|webp))/mi
      @service = :image
    end

    private
    def render(url)
      return <<EOF
      <div class="ejs-image ejs-embed">
        <div class="ne-image-wrapper">
          <img src="#{url}"/>
        </div>
      </div>
EOF
    end
  end
end
