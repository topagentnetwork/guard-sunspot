require 'guard/compat/plugin'
require "guard/sunspot/version"

module Guard
  class Sunspot < Plugin
    def initialize(options={})
      super

      @environment = options.fetch(:environment, 'development')
      @bundler = options.fetch(:bundler, false)
      @zeus = options.fetch(:zeus, false)
    end

    def start
      system "#{rake} sunspot:solr:start RAILS_ENV=#{@environment}"
      UI.info "Sunspot started"
    end

    def stop
      system "#{rake} sunspot:solr:stop RAILS_ENV=#{@environment}"
      UI.info "Sunspot stopped"
    end

    def reload
      stop
      start
    end

    def run_on_changes(path)
      reload
    end
    # for guard 1.0.x and earlier
    alias :run_on_change :run_on_changes

    private

    def rake
      rake = []
      rake << "bundle exec" if @bundler
      rake << "zeus" if @zeus
      rake << "rake"
      rake.join ' '
    end
  end
end
