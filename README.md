= NfgUi
The authoritative resource for the Network for Good front-end UI, empowered by the NFG Design System.

## Setup

1. Clone repo:

```ruby
$ git clone https://github.com/network-for-good/nfg_ui.git
```

2. Bundle gems

```ruby
$ bundle exec bundle install
```

3. Create database

```ruby
$ rake db:create

# which should output:
# Created database 'db/development.sqlite3'
# Created database 'db/test.sqlite3'
```

## To browse the components:
Browse the components at: *http://localhost:3000/*

_From the gem's root directory (not spec/test_app/):_, 
Begin rails server the normal way.

```ruby
$ rails s
```

If you're running other rails apps on port 3000 or 3001 you can run this on another port, for example:

```ruby
$ rails s -p 3003
```

## Specs
_From the gem's root directory (not spec/test_app/):_
This gem comes with spring, you can use spring when executing rspec

```ruby
$ spring rspec
```


