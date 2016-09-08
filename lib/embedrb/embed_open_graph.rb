require 'opengraph_parser'
require_relative 'base'
require_relative 'utils'

module  EmbedRb
  class OpenGraph_
    include EmbedRb::Base

    def initialize(input, output, options, embeds)
      @input = input
      @output = output
      @options = options
      @embeds = embeds
      @url_regex = EmbedRb.url_regex
      pattern = ['flickr\.com|youtube\.com|youtu\.be|\.mp4|\.ogv|\.webm|\.mp3|\.wav|\.gif|\.pdf|\.doc|\.ppt|\.docx|\.jpg|\.jpeg|\.tiff|\.png|\.svg|\.webp|\.ogg']
      openGraphOptions = options[:openGraphOptions]
      if openGraphOptions[:excluded_regex]
        pattern[1] = openGraphOptions[:excluded_regex]
      end
      @excluded_regex = Regexp.new(pattern.join("|"), Regexp::IGNORECASE)
    end

    def process()
      @input.scan(@url_regex) {|match|
        url = match[2]
        short_url = shorten(url)
        if !exclude?(url) && !@options[:served].include?(short_url) && EmbedRb.process_more?(@options, :openGraphEndpoint, @embeds)
          data = fetch(url)
          if data
            @options[:served] << short_url
            @embeds << {
              :key => url,
              :text => render(data)
            }
          end
        end
      }

      @output
    end

    private
    def fetch(url)
      begin
        OpenGraph.new(url)
      rescue StandardError => e
        # error handling
        p e
        return nil
      end
    end

    def render(data)
      return <<EOF
        <div class="ejs-embed ejs-ogp">
		      <div class="ejs-ogp-thumb" style="background-image:url(#{data.images ? data.images[0] : ''})" ></div>
		      <div class="ejs-ogp-details">
		        <div class="ejs-ogp-title">
              <a href="#{data.url}" target="#{@options[:linkOptions][:target]}">
                #{data.title}
              </a>
            </div>
		        <div class="ejs-ogb-details">#{data.description}</div>
          </div>
        </div>
EOF
    end

    def exclude?(url)
      url.match(@excluded_regex) ? true : false
    end
  end
end
