# Rollr

Rollr is a gem that simulates rolling dice.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rollr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rollr

## How to Get Rolling

```
$ gem install rollr
$ irb
> require 'rollr'
#=> true
```

### The `Die` Class

`Rollr` lets you make `Die`, and these `die` can have any number of sides.

```
> d6 = Rollr::Die.new(6)
```

When you roll a `Die`, you get a `RollResult`. 

```
> d6.roll
#=> <Rollr::RollResult #hash total: 3, rolls: [3], number_of_dice: 1, die_sides: 6>
> d6.roll
#=> <Rollr::RollResult #hash total: 6, rolls: [6], number_of_dice: 1, die_sides: 6>
```

You can roll multiple dice of the same kind by passing a number to the `roll` argument with the `number` keyword argument. 

```
> d6.roll(number: 3)
#=> <Rollr::RollResult #hash total: 9, rolls: [3, 5, 1], number_of_dice: 3, die_sides: 6>
```

### `RollResult`s
```
> result = d6.roll(number: 3)
#=> <Rollr::RollResult #hash total: 14, rolls: [2, 6, 6], number_of_dice: 3, die_sides: 6>
```

The `RollResult` has few helpful things to report about your roll. 

The `#total` method represents the sum total of the dice that were rolled: 

```
> result.total
#=> 14
```

The `#rolls` array, which reports the individual results of any dice rolled: 

```
> result.rolls
#=> [2, 6, 6]
```

`#number_of_dice` tells you how many dice were rolled this time: 

```
result.number_of_dice
#=> 3 
```

`#die_sides` reports the number of sides on the dice rolled in this result:

```
result.die_sides
#=> 6
```

### Dice Constants

Rollr comes pre-packaged with several shortcuts for popular Die sizes:

```
#D20
> result = Rollr::D20.roll
#=> <Rollr::RollResult #hash total: 18, rolls: [18], number_of_dice: 1, die_sides: 20>

#D12
> result = Rollr::D12.roll
#=> <Rollr::RollResult #hash total: 6, rolls: [6], number_of_dice: 1, die_sides: 12>

#D10
> result = Rollr::D10.roll
#=> <Rollr::RollResult #hash total: 6, rolls: [6], number_of_dice: 1, die_sides: 12>

#D8
> result = Rollr::D8.roll
#=> <Rollr::RollResult #hash total: 6, rolls: [6], number_of_dice: 1, die_sides: 12>

#D6
> result = Rollr::D6.roll
#=> <Rollr::RollResult #hash total: 6, rolls: [6], number_of_dice: 1, die_sides: 12>

#D4
> result = Rollr::D4.roll
#=> <Rollr::RollResult #hash total: 6, rolls: [6], number_of_dice: 1, die_sides: 12>

#D3
> result = Rollr::D3.roll
#=> <Rollr::RollResult #hash total: 6, rolls: [6], number_of_dice: 1, die_sides: 12>

#D2
> result = Rollr::D2.roll
#=> <Rollr::RollResult #hash total: 6, rolls: [6], number_of_dice: 1, die_sides: 12>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alxjrvs/rollr. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
