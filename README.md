# embedrb

embedrb is a ruby port of [EmbedJS](http://riteshkr.com/embed.js/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'embedrb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install embedrb


## Simple Usage

```ruby
input = <<EOF
I recomended this youtube video https://www.youtube.com/watch?v=wF_3Rp8oe1M
 http://www.google.com/
 the following is geocode
 @(東京駅)
EOF
opts = {
#  :openGraphEndpoint => 'http://opengraph.io/api/1.0/site/',
  :gmap => true,
  :gmapOptions => {
    :googleAuthKey => 'google-access-key'
  }
}
embed = EmbedRb::Embed.new(opts, input)
print(embed.process)
```

## Supported Service

- Supprted
  - LINK
  - OPENGRAPH
  - MAP
  - image
    - BASICIMAGE
    - FLICKR
    - INSTAGRAM
  - video
    - BASICVIDEO
    - TED
    - YOUTUBE
      - embed only(no detail description)
    - USTREAM
      - not working well
  - audio
    - BASICAUDIO
- Will Supported
  - SMILEY
  - HIGHLIGHTCODE
  - IDEONE
  - PLUNKER
  - JSBIN
  - CODEPEN
  - JSFIDDLE
  - GIST
  - DAILYMOTION
  - LIVELEAK
  - VINE
  - VIMEO
  - GITHUB
  - SOUNDCLOUD
  - SPOTIFY
  - SLIDESHARE

- Not Supported
  - MARKDOWN
  - EMOJI

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/liris/embedrb.

== Copyright

Copyright (c) 2016 liris. See LICENSE.txt for
further details.
