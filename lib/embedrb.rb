$LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require 'embedrb/embed'

if $0 == __FILE__
  input = <<EOF
  hoge https://www.youtube.com/watch?v=wF_3Rp8oe1M done
   http://www.google.com/
   the following is geocode
   @(東京駅)
   http://hoge.fuga.com/xxx/yyy.png
   https://www.flickr.com/photos/parismadrid/5573484679/in/photolist-9uvyPr-7TD5uZ-jYwbo8-qeZLRe-odzeYC-n8x6Xn-dzq2Ws-oRNMGp-68DxGi-c4DxV7-bnmwjN-nqZDVD-kF39se-rXJWT4-nTTR4S-7YLgdX-apPuvi-q1DhYc-kFWFjG-a2c9kr-aPGmhK-oqB5cQ-ziBGRr-oBkGxp-pEFgd8-jY9diK-mDTbpD-jzSaXQ-cuCWwN-pzK88U-9HvHVt-dBPTZV-nKdYRM-oEDGkL-bTygzn-o3CxjL-rhtanH-oXpW1i-s4Jdat-p8N1RJ-fhpghZ-dX2tPC-v8R2LX-x7M7j1-xFACNe-cAWLSf-A6FvqE-adcNyU-t2N6Hh-j1TaxV

   https://www.instagram.com/p/BBmsYJesuYH/?tagged=beach
   https://hoge.fuga.com/video.mp4

   https://ted.com/talks/sometalk
   http://www.ustream.tv/channel/%E3%81%AC%E3%81%93%E3%81%AE%E3%81%93
   http://www.ustream.tv/embed/5832768?html5ui

   ---------------------
EOF

  opts = {
  #  :openGraphEndpoint => 'http://opengraph.io/api/1.0/site/',
    :gmap => true,
    :gmapOptions => {
      :googleAuthKey => ENV['GOOGLE_AUTH_KEY'],
      :mode => 'streetview'
    },
  }
  embed = EmbedRb::Embed.new(opts, input)
  print(embed.process)
end
