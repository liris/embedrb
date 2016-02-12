require_relative '../utils'
require_relative '../base.rb'

module EmbedRb
  class Ted
    include EmbedRb::Base

    def initialize(input, output, options, embeds)
      @input = input
      @output = output
      @embeds = embeds
      @options = options
      @regex = /(ted.com\/talks\/([a-zA-Z0-9_]+))/mi
    end

    private
    def url_to_text(matched)
      _id = matched[1]
      return render _id
    end

    def render(_id)
      dims = EmbedRb.get_dimensions(@options)
      return <<EOF
      <div class="ejs-embed ejs-ted">
        <iframe src="http://embed.ted.com/talks/#{_id}.html" height="#{dims[:height]}" width="#{dims[:width]}" />
      </div>
EOF
    end
  end
end
