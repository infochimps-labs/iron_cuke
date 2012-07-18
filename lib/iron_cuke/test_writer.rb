require 'erubis'

class TestWriter

  TESTABLE_ASPECTS = [:ports]

  @loaded_templates = {}
  
  def self.template(aspect)
    @loaded_templates[aspect] ||= Erubis::Eruby.new(File.read("#{File.dirname(__FILE__)}/templates/#{aspect.to_s}.eruby"))
    return @loaded_templates[aspect]
  end

  def self.render(server, outdir)
    server_dir = [outdir, server.name].join('/')
    Dir.mkdir(server_dir) unless File.exists?(server_dir)
    server.components.each do |component|
      comp_dir = [server_dir, component.fullname].join('/')
      Dir.mkdir(comp_dir) unless File.exists?(comp_dir)
      TESTABLE_ASPECTS.each do |aspect|
        next unless 
        p "Rendering template for #{server.name} - #{component.fullname}"
        test = self.template(aspect).evaluate(component.to_wire)
        File.open("#{comp_dir}/#{aspect.to_s}.feature",'w') { |f| f.write(test)}
      end
    end
  end
end
