module Proctor
  class PortProctor < CollectionProctor
    self.register_proctor
    def write_test(component,outdir)
      return if component.ports.values.empty?
      super(component,outdir)
    end
  end
end
