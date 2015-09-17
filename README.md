# Invoke Call

A ruby wrapped command line tool for placing phone calls.

## Installation

### Pull the Repo Locally and Install the Gem

```bash
$ git clone https://github.com/joshuacook/invoke_call.git
$ rake build
$ gem install pkg/invoke_call-0.1.0.gem
```

### Compile necessary binaries

```bash
$ rake compile_binaries
```

## Usage 

### General Usage

```bash 
$ invoke_call <NUMBER BEING CALLED> <NUMBER CALLING FROM> <RINGSWITCH> <CALL SCENARIO>
```

Call scenarios should be a string consisting only of the keywords `wait` and `press`, each accompanied by an integer. 

e.g. 

```bash
$ invoke_call 8885551212 8055551212 54.54.54.54 "wait 5, press 1, wait 5, press 3, wait 5"
```

would place the call, wait five seconds, send a keypress of 1, wait 5 seconds, send a keypress of 3, wait 5 seconds, and then hang up.


### Usage in Ruby

Add this line to your application's Gemfile:

```ruby
gem 'invoke_call', :git => 'git://github.com/joshuacook/invoke_call.git'
```

Add the following to your `.rb` file

```ruby
require_relative 'invoke_call'

call_phone_number("<NUMBER BEING CALLED>",{'ringswitch_node' => "<RINGSWITCH>", 'client_number' => '<NUMBER CALLING FROM'>}){
  <CALL SCENARIO STEP 1>
  ...
  <CALL SCENARIO STEP n>
}
```

Note the variation in syntax. In a script, configuration variables are passed as JSON and the scenario is passed as a block. For example, 


```ruby
require_relative 'invoke_call'

call_phone_number("8885551212",{'ringswitch_node' => "54.54.54.54", 'client_number' => '8055551212' }){
  wait 5
  press 1
  wait 5
  press 3
  wait 5
}
```