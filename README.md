# rss_reader

TODO: Write a description here

## Installation

TODO: Write installation instructions here

## Usage

TODO: Write usage instructions here

## Development

```
$ docker build -t rss_dev -f Dockerfile.dev .
$ docker run -d --rm -it --name rss_app -p 3001:3001 -v `pwd`:/home/appuser/rss_reader rss_dev
$ docker exec -it rss_app su - appuser
$ cd rss_reader
$ shards install
# crystal build --release src/script/micrate.cr -o bin/micrate
# bin/micrate up
$ crystal run src/rss_reader.cr  # http://localhost:3001/
 
$ docker stop rss_app
```

## Contributing

1. Fork it ( https://github.com/[your-github-name]/rss_reader/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[your-github-name]](https://github.com/[your-github-name]) tomerun - creator, maintainer
