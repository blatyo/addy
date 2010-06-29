# Addy

Allows pretty summations. Instead of writing:

    (1..5).inject(0) do |memo, num|
      memo + (num**num)
    end

You write:

    sum(1..5) do |num|
      num**num
    end
    
Personally, I would rather write the latter.

## Usage

Install the gem:

    gem install addy

Then use it!

    require 'addy'

    class MyClass
      #include it in a class or in Object to get it everywhere
      include Addy
      
      def my_awesome_adder(range)
        sum(range)
      end
    end

When you include addy on a class that implements inject, you don't even need to pass a value to it. Instead it calls sum on your class.

    require 'addy'

    class MyClass < Range
      include Addy
      
      def my_awesome_adder
        sum
      end
    end

### Calling It
You can call either sum or summation. They're aliases for the same thing.

Note: The following assumes Addy is included into Range.

When you pass a block to sum it will execute the block on the current number before adding it to the sum.

    sum(1..5) {|num| num + 1}  #=> 20
    (1..5).sum {|num| num + 1} #=> 20

You don't have to pass a block though!

    #this
    sum(1..5)              #=> 15
    #and
    (1..5).sum             #=> 15
    
    #are equivalent to
    sum(1..5) {|num| num}  #=> 15
    #and
    (1..5).sum {|num| num} #=> 15
    
### Input
Ranges and numeric arrays both work well.

    sum(1..5)         #=> 15
    sum([1,2,3,4,5])  #=> 15

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Allen Madsen. See LICENSE for details.

PS: Isn't it ridiculous how much documentation I wrote for one function?