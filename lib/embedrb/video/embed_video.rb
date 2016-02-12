require_relative '../utils'
require_relative '../base.rb'

module EmbedRb
  class BasicVideo
    include EmbedRb::Base

    def initialize(input, output, options, embeds)
      @input = input
      @output = output
      @embeds = embeds
      @options = options
      @regex = /((?:https?):\/\/\S*\.(?:ogv|webm|mp4))/mi
    end

    private
    def render(url)
      return <<EOF
      <div class="ejs-video ejs-embed">
        <div class="ejs-video-player">
          <div class="ejs-player">
            <video src="#{url}" class="ejs-video-js video-js" controls></video>
          </div>
        </div>
      </div>
EOF
    end
  end
end
