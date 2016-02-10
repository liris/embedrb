require_relative 'utils'

module  EmbedRb
  # input = "hoge http://www.youtubue.com/watch?a=b done\n https://hoge.fug/d"
  # url = Embed::Url.new(input, {:linkOptions => {:target => '_blank'}})
  # print(url.process)
  class Url
    def initialize(input, output, options, embeds)
      @input = input
      @options = options
      @url_regex = EmbedRb.url_regex
    end

    def process()
      config = EmbedRb.option(@options, :linkOptions)
      @input.gsub(@url_regex) {|match|
        extention = nil
        if match.include?(".")
          extention = match[match.rindex(".")+1, match.length].downcase
        end
        if config[:exclude].include? extention
          match
        else
          "<a href=\"#{EmbedRb.to_url(match)}\" rel=\"#{config[:rel]}\" target=\"#{config[:target]}\">#{match}</a>"
        end
      }
    end
  end
end
