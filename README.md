# Functional::Lists

Ruby is awesome, Functional Programming is awesome. Yet the two don't
naturally mix as well "out of the box" as you would expect. A very
common dynamic data structure is the Linked List, and Ruby is missing
it.

## Why a Linked List anyway?

We have arrays and we have hashmaps, why do need this collection type
again?

Arrays in ruby are super fast, when they are small. This is because when
you create an array of say (16) places, Ruby actually makes a larger
array then you need. It knows that resizing arrays is an expensive
operation.

If you had an array of several thousand or say ten thousand elements,
and you wanted to put something in the middle of the list, well, you
really cant. You can split the original array into head and tail and
then insert and join, but that is a lot of copying data!

``
[1,2,3,4,5,6,7,8,9,10] # original array
[1,2,3,4]              # head
[5,6,7,8,9,10]         # tail

head + [4.5] + tail    # new array with insertion
```

Now we have 5 arrays in memory! We have the original, the head, the
tails, the single item array, and the array the holds the 'composite'
array, ie the one you made from joining 3.

## Dynamic Size Allocation

In a linked list, unlike the Array, the *content* of the list is the
star, not the collection *object*. So each item in the list points to
the next one, and in a doubly linked list, each element *points*
backward to the previous item in the list.

```
{1,2,3,4,5,6}

1.next     #=> 2
4.previous #=> 3

6.next     #=> nil
1.previous #=> nil
```

If we want to insert something in the middle, we just twiddle the
pointers:

```
new_num = 4.5
new_num.next = 5
4.next = new_num
5.previous = 4.5
```

Now 4.5 comes after 4 and before 5, and if you walk forward or backward,
nothing really changes except the insertion. The cool thing though is
*there is no array copying here*. We just added a single item, we didn't
*change* some large data structure with expensive allocation.



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
