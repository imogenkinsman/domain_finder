describe DomainFinder, :vcr do

  it 'GETs domains from registrar' do
    expect(DomainFinder::search(['thezets'])).to eq ["✘  thezets.com", "○  thezets.net", "○  thezets.org", "○  thezets.co",
                                                     "○  thezets.io", "○  thezets.me", "✘  th", "✘  thez.et"]
  end

  it 'GETs multiple queries' do
    expect(DomainFinder::search(['twitbook', 'facetweet'])).
        to eq ["** twitbook **", "✘  twitbook.com", "✘  twitbook.net","○  twitbook.org", "○  twitbook.co",
               "○  twitbook.io", "○  twitbook.me", "○  twit.bo", "?  twit.book", "✘  tw", "✘  twit.boo", "✘  tw.it",
               "** facetweet **", "✘  facetweet.com", "✘  facetweet.net", "○  facetweet.org", "✘  facetweet.co",
               "○  facetweet.io", "✘  facetweet.me", "○  facetw.ee", "?  face.tw", "✘  facetwe.et", "✘  fac.et", "✘  f.ac"]

  end

  it 'raises an error if the API response code is unexpected (not 200 or 400)' do
    #stub_request(:get, )
  end

end