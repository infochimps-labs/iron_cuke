module Proctor

  PROCTORS = Set.new

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

  class BaseProctor
    def self.register_proctor
      Proctor::PROCTORS << self.new
    end

    def aspect_handle
      @aspect_handle ||= self.class.name.split('::').last.gsub(/Proctor/,'').downcase
    end
    
    def template
      if @template.nil?
        temp = File.read("#{File.dirname(__FILE__)}/proctors/templates/#{aspect_handle}.eruby")
        @template = Erubis::Eruby.new(temp)
      end
      return @template
    end

    def write_test(component,outdir)
      FileUtils.mkdir_p(outdir)
      test = template.evaluate(component.to_wire)
      File.open("#{outdir}/#{aspect_handle}.feature",'w') { |f| f.write(test)}
    end
  end

  class CollectionProctor < BaseProctor
    def aspect_handle
      @aspect_handle ||= "#{super}s".to_sym
    end

    def write_test(component,outdir)
      return if component.send(aspect_handle.to_sym).values.empty?
      super(component,outdir)
    end
  end
end
