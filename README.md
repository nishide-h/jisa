Jisa
====

Time difference in Japanese.  
It returns japanese string with the difference in terms of year, month, week, day, hour, minute and second.
  
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jisa'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jisa

## Usage

```ruby
Jisa.in_japanese(Time.now - 1)
# => "1秒前"

Jisa.in_japanese(Time.now - 60)
# => "1分前"

Jisa.in_japanese(Time.now - 60 * 60)
# => "1時間前"

Jisa.in_japanese(Time.now - 60 * 60 * 24)
# => "1日前"
 
Jisa.in_japanese(Time.now - 60 * 60 * 24 * 7)
# => "1週間前"
 
Jisa.in_japanese(Time.now - 60 * 60 * 24 * 7 * 4)
# => "1ヶ月前"
  
Jisa.in_japanese(Time.now - 60 * 60 * 24 * 7 * 4 * 12)
# => "1年以上前"
```

## Contributing

1. Fork it ( https://github.com/nishide-h/jisa/fork )
1. Create your feature branch (git checkout -b my-new-feature)
1. Commit your changes (git commit -am 'Add some feature')
1. Push to the branch (git push origin my-new-feature)
1. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


