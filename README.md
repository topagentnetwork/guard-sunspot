# Guard::Sunspot

Guard::Sunspot allows you to automatically start and stop your solr
server.

## Install
The simplest way to install Guard is to use [Bundler](http://gembundler.com/).
Please make sure to have [Guard](https://github.com/guard/guard) installed before continue.

Add Guard::Cucumber to your `Gemfile`:

```ruby
group :development do
  gem 'guard-sunspot'
end
```

Add the default Guard::Cucumber template to your `Guardfile` by running:

```bash
$ guard init sunspot
```

## Options
You can set RAILS\_ENV by setting the  `:environment` option.

```ruby
guard 'sunspot', :environment => 'development' do
  watch('Gemfile.lock')
  watch('config/sunspot.yml')
end
```  
