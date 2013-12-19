# Functional::Lists

Ruby is awesome, Functional Programming is awesome. Yet the two don't
naturally mix as well "out of the box" as you would expect. A very
common dynamic data structure is the Linked List, and Ruby is missing
it.

## Why a Linked List anyway?

We have arrays and we have hashmaps, why do need this collection type
again?

Consider this code:

```ruby
some_array #=> 10_000 items

new_array = some_array + [new_item] 
```


## Installation

Add this line to your application's Gemfile:

    gem 'functional-lists'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install functional-lists

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
