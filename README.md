# Randsum
[![Code Climate](https://codeclimate.com/github/alxjrvs/Randsum/badges/gpa.svg)](https://codeclimate.com/github/alxjrvs/Randsum)
[![Build Status](https://travis-ci.org/alxjrvs/Randsum.svg?branch=master)](https://travis-ci.org/alxjrvs/Randsum)
[![Test Coverage](https://codeclimate.com/github/alxjrvs/Randsum/badges/coverage.svg)](https://codeclimate.com/github/alxjrvs/Randsum/coverage)

Randsum is a gem that simulates rolling dice.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'randsum'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install randsum

## How to Get Rolling

```
$ gem install randsum
$ irb
> require 'randsum'
#=> true
```

### The `Die` Class

`Randsum` lets you make `Die`, and these `die` can have any number of sides.

```
> d6 = Randsum::Die.new(6)
```

When you roll a `Die`, you get a `RollReport`.

```
> d6.roll
#=> <Randsum::RollReport #hash total: 3, rolls: [3], number_of_dice: 1, die_sides: 6>
> d6.roll
#=> <Randsum::RollReport #hash total: 6, rolls: [6], number_of_dice: 1, die_sides: 6>
```

You can roll multiple dice of the same kind by passing a number to the `roll` argument.

```
> d6.roll(number: 3)
#=> <Randsum::RollReport #hash total: 9, rolls: [3, 5, 1], number_of_dice: 3, die_sides: 6>
```

### `RollReport`s
```
> result = d6.roll(number: 3)
#=> <Randsum::RollReport #hash total: 14, rolls: [2, 6, 6], number_of_dice: 3, die_sides: 6>
```

The `RollReport` has few helpful things to report about your roll.

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

#### Manipulating `RollReport`s

Roll results can be further manipulated after their original creation. To facilitate popular use-cases for Dice rolling, `RollReport`s also include public `#drop_lowest` and `#drop_highest` methods.

`#drop_lowest` returns a new `RollReport` without the lowest numerical die roll.

```
> result = d6.roll(number: 4)
#=> <Randsum::RollReport #hash total: 14, rolls: [3, 1, 4, 6], number_of_dice: 4, die_sides: 6>

> result.rolls
#=> [3, 1, 4, 6]

> result.total
#=> 14

> new_result = result.drop_lowest
#=> <Randsum::RollReport #hash total: 13, rolls: [3, 4, 6], number_of_dice: 3, die_sides: 6>

> new_result.rolls
#=> [3, 4, 6]

> new_result.total
#=> 13
```

Similarly, `#drop_highest` will remove the highest number in the `rolls` array.

```
> new_result = result.drop_highest
#=> <Randsum::RollReport #hash total: 8, rolls: [3, 1, 4], number_of_dice: 3, die_sides: 6>

> new_result.rolls
#=> [3, 1, 4]

> new_result.total
#=> 8
```

Both `#drop_lowest` and `#drop_highest` can also take an optional integer argument.

```
> new_result = result.drop_highest(2)

> new_result.rolls
#=> [3, 1]

> new_result.total
#=> 4
```

### Dice Constants

Randsum comes pre-packaged with several shortcuts for popular Die sizes:

```
#D20
> result = Randsum::D20.roll
#=> <Randsum::RollReport #hash total: 18, rolls: [18], number_of_dice: 1, die_sides: 20>

#D12
> result = Randsum::D12.roll
#=> <Randsum::RollReport #hash total: 6, rolls: [6], number_of_dice: 1, die_sides: 12>

#D2-6, D8, and D10!
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alxjrvs/randsum. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
