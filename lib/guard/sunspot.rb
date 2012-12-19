require "guard"
require "guard/guard"
require "guard/sunspot/version"

module Guard
  class Sunspot < Guard
    def initialize(watchers=[], options={})
      super

      @environment = options[:environment] || 'development'
      @bundler = options.fetch(:bundler, false)
    end

    def start
      system "#{command_prefix} rake sunspot:solr:start RAILS_ENV=#{@environment}"
      UI.info "Sunspot started"
    end

    def stop
      system "#{command_prefix} rake sunspot:solr:stop RAILS_ENV=#{@environment}"
      UI.info "Sunspot stopped"
    end

    def reload
      stop
      start
    end

    def run_on_change(path)
      reload
    end

    private

    def command_prefix
      "bundle exec" if @bundler
    end
  end
end
