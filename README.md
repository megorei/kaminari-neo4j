# Kaminari::ActiveGraph

Adds [ActiveGraph](https://github.com/neo4jrb/activegraph) support to [kaminari](https://github.com/amatsuda/kaminari).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kaminari-activegraph'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kaminari-activegraph

## Usage

```ruby
MyModel.page(4).per(10)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/kaminari-activegraph/fork )
2. Install the development dependencies (`bundle install`)
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Make your changes
5. Run the test suite (`bundle exec rspec`)
6. Commit your changes (`git commit -am 'Add some feature'`)
7. Push to the branch (`git push origin my-new-feature`)
8. Create a new Pull Request
