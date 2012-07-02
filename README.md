# Nominatim

A Ruby wrapper for the Nominatim API. [![Build Status](https://secure.travis-ci.org/jakubsvehla/nominatim.png?branch=master)](http://travis-ci.org/jakubsvehla/nominatim)

## Installation

Add this line to your application's Gemfile:

    gem 'nominatim'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nominatim

## Documentation

[http://rdoc.info/gems/nominatim][documentation]

[documentation]: http://rdoc.info/gems/nominatim

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
  config.email = 'your-email-address@example.com'
  config.endpoint = 'http://open.mapquestapi.com/nominatim/v1'
end
```

## Contributing

1. [Fork the repository.][fork]
2. [Create a topic branch.][branch]
3. Add specs for your unimplemented feature or bug fix.
4. Run `bundle exec rake spec`. If your specs pass, return to step 3.
5. Implement your feature or bug fix.
6. Run `bundle exec rake spec`. If your specs fail, return to step 5.
7. Run `open coverage/index.html`. If your changes are not completely covered
   by your tests, return to step 3.
8. Add, commit, and push your changes.
9. [Submit a pull request.][pr]

[fork]: http://help.github.com/fork-a-repo/
[branch]: http://learn.github.com/p/branching.html
[pr]: http://help.github.com/send-pull-requests/

## Supported Ruby Versions

Nominatim is tested under 1.9.2 and 1.9.3.

## Copyright

Copyright (c) 2012 Jakub Svehla

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
