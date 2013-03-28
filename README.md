# Peek::PG

Provide a peek into the Postgres queries made during your application's requests.

Things this peek view provides:

- Total number of Postgres queries called during the request
- The duration of the queries made during the request

## Installation

Add this line to your application's Gemfile:

    gem 'peek-pg'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install peek-pg

## Usage

Add the following to your `config/initializers/peek.rb`: 

```ruby
Peek.into Peek::Views::PG
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
