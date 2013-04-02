module IronCuke
  module Proctor
    # Defines base behavior for the proctors. 
    # Incomplete and should not be instantiated directly
    class BaseProctor

      def self.inherited(klass)
        Proctor.proctor_classes << klass
      end

      # By default, proctors classes should be named {aspect}Proctor
      # and {aspect} will become the class's aspect handle.
      # Override this method to change that.
      def template_name
        @template_name ||= (self.class.name.split('::').last.gsub(/Proctor/,'').downcase)
      end

      # Returns the erubis template for this proctor.
      # By default it is loaded from templates/{aspect_handle}.eruby
      def template
        @template ||= template_for_name template_name
      end

      def template_for_name template_name
        template_file = File.read("#{File.dirname(__FILE__)}/../templates/#{template_name}.eruby")
        Erubis::Eruby.new(template_file)
      end

      def will_write?(component)
        true
      end

      def write
        template.result(binding())
      end
    end
  end
end
