# PaperTrailHtmlDiff

Print Paper Trail changes in a nice format!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paper_trail_html_diff'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paper_trail_html_diff

## Usage

Simply call in your view:

render_version(version)

Gem will detect attribute you are using to store changes (object or changeset)
Some fields are not shown (passwords, tokens, created_at and updated_at)
Output formats are aimed to use Bootstrap or Foundation CSS frameworks

## TODO

- Write tests.. :(
- Improve code
- Improve doc
- Finish / add more configuration options


## Contributing

1. Fork it ( https://github.com/[my-github-username]/paper_trail_html_diff/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
