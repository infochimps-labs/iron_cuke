module IronCuke
  module Proctor
    class DaemonsProctor < BaseProctor
   
      # Awkward, also duplicates code, also breaks Zabbix announcements
      # TODO: Figure out a better way to check if there is a valid daemon
      # announcement.
      # TODO: Fix Zabbix announcements
      def will_write?(component)
        return false if component['daemons'] == nil || component['daemons'] == {}
        component['daemons'].each do |name, daemon|
           if daemon['name'] != nil && daemon['user'] != nil
             return true
           end
        end
        return false
      end

      def write_test(component)
        @daemons = []
        component['daemons'].each do |name, daemon|
           if daemon['name'] != nil && daemon['user'] != nil
             @daemons << {'name' => daemon['name'], 'user' => daemon['user']}
           end
        end
        write component
      end

    end
  end
end
