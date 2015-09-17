# Invocall

A ruby wrapped command line tool for placing phone calls.

## Installation

### Install The Gem

```bash
gem specific_install https://github.com/invoca/invocall.git
```

### Compile necessary binaries

## Usage 

### General Usage

```bash 
$ invoke_call <NUMBER BEING CALLED> <NUMBER CALLING FROM> <RINGSWITCH> <CALL SCENARIO>
```

Call scenarios should be a string consisting only of the keywords `wait` and `press`, each accompanied by an integer. 

e.g. `"wait 5, press 1, wait 5, press 3, wait 5"`

would place the call, wait five seconds, send a keypress of 1, wait 5 seconds, send a keypress of 3, wait 5 seconds, and then hang up.


### Usage in Ruby

Add this line to your application's Gemfile:

```ruby
gem 'invocall', :git => 'git://github.com/invoca/invocall.git'
```

Add the following to your `.rb` file

```ruby
require_relative 'invoke_call'

call_phone_number("<NUMBER BEING CALLED>",{'ringswitch_node' => "<RINGSWITCH>"}){
  <CALL SCENARIO STEP 1>
  ...
  <CALL SCENARIO STEP n>
}
```

Note the variation in syntax. In a script, the scenario is passed as a block. For example, 

```ruby
require_relative 'invoke_call'

call_phone_number("8885551212",{'ringswitch_node' => "54.54.54.54"}){
  wait 5
  press 1
  wait 5
  press 3
  wait 5
}
```