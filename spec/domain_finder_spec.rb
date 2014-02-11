describe DomainFinder, :vcr do

  it 'GETs domains from registrar' do
    expect(DomainFinder::search(['thezets'])).to eq ["x  thezets.com", "o  thezets.net", "o  thezets.org", "o  thezets.co",
                                                     "o  thezets.io", "o  thezets.me", "x  th", "x  thez.et"]
  end

  it 'GETs multiple queries' do
    expect(DomainFinder::search(['twitbook', 'facetweet'])).
        to eq ["** twitbook **", "x  twitbook.com", "x  twitbook.net","o  twitbook.org", "o  twitbook.co",
               "o  twitbook.io", "o  twitbook.me", "o  twit.bo", "?  twit.book", "x  tw", "x  twit.boo", "x  tw.it",
               "** facetweet **", "x  facetweet.com", "x  facetweet.net", "o  facetweet.org", "x  facetweet.co",
               "o  facetweet.io", "x  facetweet.me", "o  facetw.ee", "?  face.tw", "x  facetwe.et", "x  fac.et", "x  f.ac"]

  end

  it 'raises an error if the API response code is unexpected (not 200 or 400)' do
    stub_request(:get, "https://domai.nr/api/json/search?q=thezets").to_return(status: 500, body: '', headers: {})
    expect{DomainFinder::search(['thezets'])}.to raise_error(RuntimeError, "Error 500 while accessing domain registrar")
  end

end