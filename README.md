#AdventureTweet

![AdventureTweet. Mathmatical!](http://i29.photobucket.com/albums/c259/dandydanny/DBC/adventuretweet_zpsef03170c.png)

Fetches an entered Twitter user's 10 most recent tweets.
AJAX. Older non-AJAX route also available.
If tweets are not yet stale, load from local DB instead.

@dandydanny

Running on local machine:

After cloning the repo, create `twitter_keys.yml` file inside `/config` directory, and supply the necessary keys.

TWITTER_KEY:
TWITTER_SECRET:

OAUTH_TOKEN:
OAUTH_TOKEN_SECRET:

Alternately, expand encrypted key file into the /config directory.

In terminal:
`bundle update`
`shotgun`
