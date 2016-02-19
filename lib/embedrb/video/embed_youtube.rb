require_relative '../utils'
require_relative '../base.rb'

module EmbedRb
  class YouTube
    include EmbedRb::Base

    def initialize(input, output, options, embeds)
      @input = input
      @output = output
      @embeds = embeds
      @options = options
      @regex = /(https?:\/\/(?:[0-9A-Z-]+\.)?(?:youtu\.be\/|youtube\.com(?:\/embed\/|\/v\/|\/watch\?v=|\/ytscreeningroom\?v=|\/feeds\/api\/videos\/|\/user\S*[^\w\-\s]|\S*[^\w\-\s]))([\w\-]{11})[?=&+%\w-]*)/mi
      @service = :youtube
    end

    private
    def url_to_text(matched)
      url = "https://www.youtube.com/embed/#{matched[1]}"
      return render url
    end

    def render(url)
      dims = EmbedRb.get_dimensions(@options)
      return <<EOF
      <div class="ejs-video-player ejs-embed">
        <iframe src="#{url}" frameBorder="0" width="#{dims[:width]}" height="#{dims[:height]}" ></iframe>
      </div>
EOF
    end
  end
end
