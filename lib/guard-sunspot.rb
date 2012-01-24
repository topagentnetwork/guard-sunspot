require "guard"
require "guard/guard"
require "guard-sunspot/version"

module Guard
  class Sunspot < Guard
    def initialize(watchers=[], options={})
      super

      @environment = options[:environment] || 'development'
    end

    def start
      system("rake sunspot:solr:start RAILS_ENV=#{@environment}")
      UI.info "Sunspot started"
    end

    def stop
      system("rake sunspot:solr:stop RAILS_ENV=#{@environment}")
      UI.info "Sunspot stopped"
    end

    def reload
      stop
      start
    end

    def run_on_change(path)
      reload
    end
  end
end
