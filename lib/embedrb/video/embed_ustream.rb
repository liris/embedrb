require_relative '../utils'
require_relative '../base.rb'

module EmbedRb
  class Ustream
    include EmbedRb::Base

    def initialize(input, output, options, embeds)
      @input = input
      @output = output
      @embeds = embeds
      @options = options
      @regex = /(ustream.tv\/([a-z\/0-9%]*))/mi
    end

    private
    def render(url)
      dims = EmbedRb.get_dimensions(@options)
      return <<EOF
      <div class="ejs-embed ejs-ustream">
        <iframe src="//www.#{url}" height="#{dims[:height]}" width="#{dims[:width]} ></iframe>
      </div>
EOF
    end
  end
end
