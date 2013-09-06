# The default proctor that gets instantiated
# when no other proctor is defined for a template.
#
# The default proctor takes all the key-value
# pairs in the supplied component and turns them into
# instance variables for the erubis binding.
module IronCuke
  module Proctor
    class DefaultProctor < BaseProctor

      def initialize aspect
        @aspect = aspect
      end

      def write_test component
        component.each { |name, value| instance_variable_set("@#{name}", value) }
        write
      end

    end
  end
end
