# Domain Finder [![Build Status](https://travis-ci.org/zetsubo/domain_finder.png?branch=master)](https://travis-ci.org/zetsubo/domain_finder)

Say you're working on a new web project and suddenly think of a good name for it. "Well, this is sort of like Facebook, and also like Twitter," you muse. "I've got it - facetweet!"

You _could_ open up a browser tab and check domains on a registrar. Or, you could search _right in your terminal_ with domain_finder.

![](screenshots/domainfinder.png)

## Installation

Easy peasy lemon squeezy:

    $ gem install domain_finder

## Usage

After installing, simply type `domain foo` in your terminal. Feeling particularly lazy? You can even search for multiple domains at once:

```
domain facetweet twitbook
** facetweet **
✘  facetweet.com
✘  facetweet.net
○  facetweet.org
✘  facetweet.co
○  facetweet.io
✘  facetweet.me
○  facetw.ee
?  face.tw
✘  facetwe.et
✘  fac.et
✘  f.ac
** twitbook **
✘  twitbook.com
✘  twitbook.net
○  twitbook.org
○  twitbook.co
○  twitbook.io
○  twitbook.me
○  twit.bo
?  twit.book
✘  tw
✘  twit.boo
✘  tw.it
```
