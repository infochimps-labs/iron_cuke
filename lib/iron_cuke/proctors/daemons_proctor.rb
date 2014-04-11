module IronCuke
  module Proctor
    class DaemonsProctor < BaseProctor

      # There's two forms of daemon announcements:
      # The raw process form
      # "daemons" : {
      #    "mongod" : {
      #       "cmd" : "mongod",
      #       "user" : "mongodb",
      #       "name" : "mongod"
      #    }
      # }
      # and the shortcut init.d service form
      # "daemons" : {
      #   "web" : {
      #     "service" : "splunk_web"
      #   }
      # }

      # FIXME: This takes an all or nothing approach
      def will_write?(component)
        if (component['daemons'] != nil && component['daemons'] != {})
          component['daemons'].inject(true) do |writes, kv|
            name, daemon = kv
            if %w(cmd user name).all? { |k| daemon.has_key?(k) } || daemon.has_key?("service")
              writes &= true 
            end
          end
        else
          false
        end
      end

      def write_test(component)
        @daemons = []
        component['daemons'].each do |name, daemon|
          if %w(cmd user name).all? { |k| daemon.has_key?(k) } # explicit form
            @daemons << {'name' => daemon['name'], 'user' => daemon['user'], 'cmd' => daemon['cmd'] }
          elsif daemon.has_key?('service') #service form
            @template = nil
            @aspect   = "daemonservice" #override proctor
            @daemons << {'name' => name, 'service' => daemon['service'] }
          end
        end
        write component
      end

    end
  end
end
