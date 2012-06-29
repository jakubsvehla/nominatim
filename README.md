# Nominatim

A Ruby wrapper for the Nominatim API.

## Installation

Add this line to your application's Gemfile:

    gem 'nominatim'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nominatim

## Usage

```ruby
places = Nominatim.search('San Francisco').limit(10).address_details(true)

for place in places
  puts "#{place.display_name} (#{place.type})"
end
puts "Found #{places.count} places."
```

## Configuration

```ruby
Nominatim.configure do |config|
  config.email = 'your-email-address@gmail.com'
  config.endpoint = 'http://nominatim.openstreetmap.org'
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
