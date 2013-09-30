module IronCuke
  module Proctor
    class LogsProctor < BaseProctor

      def write_test(component)
        @logs = []
        component['logs'].each do |key, val|
          puts "Logs key #{key} is #{val}"

          if val.is_a? Hash
            if val['glob']
              @logs << val['glob']
            elsif val['path']
              @logs << val['path']
            end
          else
            @logs << val
          end

        end
        write component
      end

    end
  end
end
