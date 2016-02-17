require 'erb'
require 'json'
require_relative 'utils'

module  EmbedRb
  class Gmap
    def initialize(input, output, options, embeds)
      @input = input
      @output = output
      @embeds = embeds
      @options = options
      @regex = /@\((.+)\)/i
    end

    def process()
      if @options[:gmapOptions][:googleAuthKey]
        @input.scan(@regex) {|match|
          location = match[0]
          @embeds << {
            key: match,
            text: render(location)
          }
        }
      end

      @output
    end

    private
    def get_coordinate(location)
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{ERB::Util.url_encode(location)}&sensor=false"
      data = JSON.parse EmbedRb.get_response(url)
      geometry = data["results"][0]["geometry"]["location"]
      [geometry["lat"], geometry["lng"]]
    end

    def render(location)
      config = @options[:gmapOptions]
      dims = EmbedRb.get_dimensions(@options)
      case config[:mode]
      when 'streetview'
        lat, lng = get_coordinate(location)
        format('streetview', config, dims, "location=#{lat},#{lng}&heading=210&pitch=10&fov=35")
      when 'view'
        lat, lng = get_coordinate(location)
        format('view', config, dims, "center=#{lat},#{lng}&zoom=18&maptype=satellite")
      else
        format('place', config, dims, "q=#{ERB::Util.url_encode(location)}")
      end
    end

    def format(mode, config, dims, params)
      url = "https://www.google.com/maps/embed/v1/#{mode}?key=#{config[:googleAuthKey]}&#{params}"
      template = <<EOF
        <div class="ejs-embed ejs-map">
          <iframe width="#{dims[:width]}" height="#{dims[:height]}" src="#{url}" ></iframe>
        </div>
EOF
    end
  end
end
