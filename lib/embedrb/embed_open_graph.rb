require 'erb'
require 'json'
require_relative 'base'
require_relative 'utils'

module  EmbedRb
  class OpenGraph
    include EmbedRb::Base

    def initialize(input, output, options, embeds)
      @input = input
      @output = output
      @options = options
      @embeds = embeds
      @url_regex = EmbedRb.url_regex
      pattern = ['flickr.com|youtube.com|youtu.be|.mp4|.ogv|.webm|.mp3|.wav|.gif|.pdf|.doc|.ppt|.docx|.jpg|.jpeg|.tiff|.png|.svg|.webp|.ogg']
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
        if !exclude?(url) && !@options[:served].include?(short_url)
          p short_url
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
      endpoint = @options[:openGraphEndpoint]
      api = endpoint + ERB::Util.url_encode(url)
      begin
        data = JSON.parse EmbedRb.get_response(api)
        if data && !data["error"]
          return data
        end
      rescue
        # TODO: error handling
      end
    end

    def render(data)
      return <<EOF
        <div class="ejs-embed ejs-ogp">
		      <div class="ejs-ogp-thumb" style="background-image:url(#{data["hybridGraph"]['image']})" />
		      <div class="ejs-ogp-details">
		        <div class="ejs-ogp-title">
              <a href="#{data['url']}" target="#{@options[:linkOptions][:target]}">
                #{data["hybridGraph"]['title']}
              </a>
            </div>
		        <div class="ejs-ogb-details">#{data["hybridGraph"]['description']}</div>
          </div>
        </div>
EOF
    end

    def exclude?(url)
      url.match(@excluded_regex) ? true : false
    end
  end
end
