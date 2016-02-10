# embedrb

embedrb is a ruby port of [EmbedJS](http://riteshkr.com/embed.js/)


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
  - video
    - YOUTUBE
      - embed only(no detail description)
- Will Supported
  - SMILEY
  - HIGHLIGHTCODE
  - IDEONE
  - PLUNKER
  - JSBIN
  - CODEPEN
  - JSFIDDLE
  - GIST
  - TED
  - DAILYMOTION
  - USTREAM
  - LIVELEAK
  - BASICVIDEO
  - VINE
  - VIMEO
  - GITHUB
  - SOUNDCLOUD
  - SPOTIFY
  - BASICAUDIO
  - FLICKR
  - INSTAGRAM
  - SLIDESHARE
  - BASICIMAGE

- Not Supported
  - MARKDOWN
  - EMOJI

## Contributing to embedrb

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2016 liris. See LICENSE.txt for
further details.
