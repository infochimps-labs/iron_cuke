module IronCuke
  module Proctor
    # Defines base behavior for the proctors. 
    # Incomplete and should not be instantiated directly
    class BaseProctor

      def self.inherited(klass)
        Proctor.proctor_classes << klass
      end

      # By default, proctors classes should be named {aspect}Proctor
      # and {aspect} will become the class's aspect handle and template 
      # name. Override this method to change that.
      def aspect
        @aspect ||= (self.class.name.split('::').last.gsub(/Proctor/,'').downcase)
      end

      # Returns the erubis template for this proctor.
      # By default it is loaded from templates/{aspect_handle}.eruby
      def template
        @template ||= template_for_name aspect
      end

      # Utility method to create an Erubis template from
      # a template name
      def template_for_name template_name
        template_file = File.read("#{File.dirname(__FILE__)}/../templates/#{template_name}.eruby")
        Erubis::Eruby.new(template_file)
      end

      # Very basic logic to skip writing the test if not necessary
      def will_write?(component)
        result = (component[aspect] != nil && component[aspect] != {})
        result
      end

      def write(component)
        @sys = component["sys"]
        @subsys = component["subsys"]
        template.result(binding())
      end

      def write_test(component)
        write component
      end
    end
  end
end
