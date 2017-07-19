[![Code Climate](https://codeclimate.com/github/alexstophel/null_record/badges/gpa.svg)](https://codeclimate.com/github/alexstophel/null_record)
[![Test Coverage](https://codeclimate.com/github/alexstophel/null_record/badges/coverage.svg)](https://codeclimate.com/github/alexstophel/null_record/coverage)
[![Build Status](https://travis-ci.org/alexstophel/null_record.svg?branch=master)](https://travis-ci.org/alexstophel/null_record)
[![Gem Version](https://badge.fury.io/rb/null_record.svg)](https://badge.fury.io/rb/null_record)

# NullRecord

NullRecord is intended to make using the [Null
Object](https://en.wikipedia.org/wiki/Null_Object_pattern) pattern with
ActiveRecord easier. I initially had all of this logic in a project and decided 
to rip it out to make it easier to share among projects.

Not sure what the Null Object pattern is all about? Here's some resources to get
you started:

[Suspicions of nil](http://www.sandimetz.com/blog/2014/12/19/suspicions-of-nil)
by Sandi Metz

[Null Objects and
Falsiness](http://devblog.avdi.org/2011/05/30/null-objects-and-falsiness/) by
Advi Grimm

Is there a resource that you find helpful? Submit a Pull Request to add it to
this list!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'null_record'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install null_record

If you're including this in a Rails application, create an initializer to
include NullRecord in ActiveRecord::Base:

```ruby
# config/initializers/null_record.rb

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.send(:include, NullRecord)
end
```

## Usage

NullRecord patches ActiveRecord finder methods to return a Null Object instead
of nil. How neat! Check it out:

Standard ActiveRecord:

```ruby
User.find(1)
=> ActiveRecord::RecordNotFound: Couldn't find User with 'id'=1
```

ActiveRecord w/ NullRecord:

```ruby
User.find(1)
=> <null:User>
```

In order to take advantage of this patching, you need to call the 
`has_null_record` class method in your model:

```ruby
class User < ActiveRecord::Base
  has_null_record
end
```

NullRecord uses the awesome [Naught](https://github.com/avdi/naught) gem by Advi
Grimm to build Null Objects. You can pass a configuration block to supplement
the default configuration:

```ruby
class User < ActiveRecord::Base
  has_null_record do |config|
    config.impersonate User

    def name
      "Please sign in..."
    end
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alexstophel/null_record. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

