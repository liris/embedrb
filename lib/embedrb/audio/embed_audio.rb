require_relative '../utils'
require_relative '../base.rb'

module EmbedRb
  class BasicAudio
    include EmbedRb::Base

    def initialize(input, output, options, embeds)
      @input = input
      @output = output
      @embeds = embeds
      @options = options
      @regex = /((?:https?):\/\/\S*\.(?:wav|mp3|ogg))/mi
    end

    private
    def render(url)
      return <<EOF
      <div class="ejs-audio ejs-embed">
        <audio src="#{url}" controls class="video-js ejs-video-js" />
      </div>
EOF
    end
  end
end
