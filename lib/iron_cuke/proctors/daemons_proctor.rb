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
          is_daemon = component['daemons'].inject([]) do |writes, kv|
            name, daemon = kv
            if daemon.is_a?(Hash) &&
                (%w(cmd user name).all? { |k| daemon.has_key?(k) } || daemon.has_key?("service"))
              writes << true
            else
              writes << false
            end
            writes
          end
          is_daemon.all?
        else
          false
        end
      end

      def write_test(component)
        @daemons = []
        component['daemons'].each do |name, daemon|
          if %w(cmd user name).all? { |k| daemon.has_key?(k) } # explicit form
            set_aspect('daemons')
            @daemons << {'name' => daemon['name'], 'user' => daemon['user'], 'cmd' => daemon['cmd'] }
          elsif daemon.has_key?('service') #service form
            set_aspect('daemonservice')
            @daemons << {'name' => name, 'service' => daemon['service'] }
          end
        end
        write component
      end

      def set_aspect aspect
        @template = nil
        @aspect   = aspect
      end

    end
  end
end
