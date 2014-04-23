# A proctor is a class responsible for rendering
# cucumber tests from gorillib models of announcements
module IronCuke
  module Proctor

    # Returns a list of the paths of all test templates that the master proctor
    # knows about.
    def self.templates
      @@templates ||= Dir.glob(File.expand_path("../templates/*.eruby", __FILE__))
    end

    # Returns a list of all base template names.
    # E.g. if your template is called 'daemons.eruby', its entry
    # in this list will be 'daemons'.
    def self.template_names
      @@template_names ||= templates.collect { |file| File.basename(file,'.eruby') }
    end

    def self.proctor_classes
      @@proctor_classes ||= []
    end

    # Returns a map from aspect => proctor instance
    # Loading of the proctor classes is done lazily here
    # because it can't be done in BaseProctor's inherited method
    # because the subclasses haven't been fully loaded by that point
    def self.proctors
      unless defined? @@proctors
        @@proctors = {}
        proctor_classes.each do |proctor_class|
          next if proctor_class == DefaultProctor
          instance = proctor_class.new
          @@proctors[instance.aspect] = proctor_class.new
        end
        template_names.each { |template| 
          @@proctors[template] ||= DefaultProctor.new template 
        }
      end
      @@proctors
    end

    # Returns a proctor for the supplied template base name.
    # Will return the default proctor if no other suitable one
    # is found.
    def self.proctor_for(template_name)
      proctors[template_name.to_s]
    end

    # Iterates over all components in the server
    # and lets each proctor have a chance to render tests
    # for the component. Tests will be deposited in 
    # outdir/server-name/component-name/aspect.feature
    # TODO: Use pathname, not join('/')
    def self.write_tests(server_name, components, out_dir)
      server_dir = [out_dir, server_name].join('/')
      components.each do |comp_name, component|
        comp_dir = [server_dir, comp_name].join('/')
        template_names.each do |template|
          next unless proctor_for(template).will_write?(component)
          puts "Rendering the '#{template}' test for #{server_name} - #{comp_name}"
          test = proctor_for(template).write_test(component) 
          
          # create the parent dir if it doesn't exist
          FileUtils.mkdir_p(comp_dir) unless File.directory?(comp_dir) 
          # write the file itself
          feature_file = [comp_dir, "#{template}.feature"].join('/')
          File.open(feature_file, 'w') { |file| file.write(test) }
        end
      end
    end
  end
end
