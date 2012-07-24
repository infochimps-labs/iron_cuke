# A proctor is a class responsible for rendering
# cucumber tests from gorillib models of announcements
module Proctor

  # list of all available proctors
  PROCTORS = Set.new

  # Iterates over all components in the server
  # and lets each proctor have a chance to render tests
  # for the component. Tests will be deposited in 
  # outdir/server-name/component-name/aspect.feature
  def self.write_tests(server, outdir)
    server_dir = [outdir, server.name].join('/')
    server.components.each do |component|
      comp_dir = [server_dir, component.fullname].join('/')
      Proctor::PROCTORS.each do |proctor|
        puts "Rendering template for #{server.name} - #{component.fullname} : #{proctor.aspect_handle} aspect"
        proctor.write_test(component,comp_dir) 
      end
    end
  end

  # Defines default behavior for the proctors
  class BaseProctor

    # Convenience method for registering new proctors
    def self.register_proctor
      Proctor::PROCTORS << self.new
    end
  
    # The name of the aspect this proctor is concerned with.
    # By default, proctors classes should be named <Aspect>Proctor
    # and <Aspect> will become the class's aspect handle.
    def aspect_handle
      @aspect_handle ||= self.class.name.split('::').last.gsub(/Proctor/,'').downcase
    end
   
    # Returns the erubis template for this proctor.
    # By default it is loaded from proctors/templates/<aspect_handle>.eruby
    def template
      if @template.nil?
        temp = File.read("#{File.dirname(__FILE__)}/proctors/templates/#{aspect_handle}.eruby")
        @template = Erubis::Eruby.new(temp)
      end
      return @template
    end

    # Default implementation of rendering the erubis template
    def write_test(component,outdir)
      FileUtils.mkdir_p(outdir)
      test = template.evaluate(component.to_wire)
      File.open("#{outdir}/#{aspect_handle}.feature",'w') { |f| f.write(test)}
    end
  end

  # Extends default behavior for proctors of collections of things
  class CollectionProctor < BaseProctor
    
    # This allows collection proctor classes to omit the pluralizing 's'
    # e.g. PortProctor is responsible for the ports aspect
    def aspect_handle
      @aspect_handle ||= "#{super}s".to_sym
    end

    # This guards the test rendering, preventing it from
    # rendering the test if the collection is empty.
    # This may not work for all schemas. See PortProctor and
    # DaemonProctor for working examples.
    def write_test(component,outdir)
      return if component.send(aspect_handle.to_sym).values.empty?
      super(component,outdir)
    end
  end
end
