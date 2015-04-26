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
You can use bundler by setting the  `:bundler` option. The default is false.
You can use zeus by setting the  `:bundler` option. The default is false.

```ruby
guard 'sunspot', :environment => 'development', :bundler => true, :zeus => false do
  watch('Gemfile.lock')
  watch('config/sunspot.yml')
end
```  
