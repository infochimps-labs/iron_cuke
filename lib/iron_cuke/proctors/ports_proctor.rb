module IronCuke
  module Proctor
    class PortsProctor < BaseProctor

      # Some of the port announcements are in weird format
      # so this proctor needs some extra logic to parse them.
      # e.g. elasticsearch:
      # "ports"=>{
      #   # this is nonstandard/bad
      #   "api"=>9300, 
      #   # this is ok
      #   "http"=>{"port"=>9200, "protocol"=>"http"}, 
      #  }
      # TODO: Fix known offenders:
      #   - Flume Master
      #   - Elasticsearch server
      #
      def write_test(component)
        @ports = {}
        component['ports'].each do |key, val|
          if val.is_a? Numeric
            @ports[key] = val
          elsif val.is_a? Hash
            @ports[key] = val['port']
          end
        end
        write component
      end

    end
  end
end
