#AdventureTweet

#### Contributors: [Daniel Lu](https://github.com/dandydanny) and [Diana Calvache](https://github.com/calvached)

![AdventureTweet. Mathmatical!](http://i29.photobucket.com/albums/c259/dandydanny/DBC/adventuretweet_zpsef03170c.png)

Fetches a user's 10 most recent tweets. Unstale tweets will be loaded from the local database.

## Ruby version

Built in Ruby 2.0.0p353

## Configuration

Clone the repo then navigate to the main directory and execute:
```
bundle update
```

Create `twitter_keys.yml` file inside `/config` directory, and supply the following necessary keys:  
TWITTER_KEY  
TWITTER_SECRET  
OAUTH_TOKEN  
OAUTH_TOKEN_SECRET  

To start the server:
```
shotgun
```

## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request