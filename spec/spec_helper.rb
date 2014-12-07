# -*- encoding : utf-8 -*-
unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_group 'Guard::Sunspot', 'lib/sunspot'
    add_group 'Specs', 'spec'
  end
end

require 'rspec'
require 'timecop'
require 'guard/compat/test/helper'
require 'guard/sunspot'

ENV["GUARD_ENV"] = 'test'
