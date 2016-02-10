
module EmbedRb
  module Base

    def process()
      embed
      @output
    end

    def embed()
      @input.scan(@regex) {|match|
        url = match[0]
        if !@options[:served].include? url
          text = url_to_text match
          if text
            @options[:served] << url
            @embeds << {
              :key => url,
              :text => text
            }
          end
        end
      }
    end

    def url_to_text(matched)
      url = matched[0]
      return render url
    end
  end
end
