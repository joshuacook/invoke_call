# Invocall

A ruby wrapped command line tool for placing phone calls.

## Installation

### Install The Gem

```bash
gem specific_install https://github.com/invoca/invocall.git
```

## Usage 

### General Usage

Launch irb and require `invocall`

```ruby 
irb(main):001:0> require 'invocall'
true
```

Place a call using this syntax: 

```ruby 
irb(main):002:0> Invocall.call_phone_number('8555550053',{'ringswitch_ip'=> '54.91.73.177'}){wait 5;press 1;wait 5}"
```

Add this line to your application's Gemfile:

```ruby
gem 'invocall', :git => 'git://github.com/invoca/invocall.git'
```

    $ 
    

    
    # Usage
    ## In a script
    
    ```
    require_relative 'invocall'
    
    call_phone_number("#{promo_number}",{'ringswitch_node'=> "#{ringswitch_node_ip}"}){
      wait 5
      press 1
      wait 5
    }
    ```
    
    ### From this repo
    
    ```
    $ bin/console
    irb(main):001:0> 
    ```

```ruby
gem 'invocall'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install invocall

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/invocall/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
