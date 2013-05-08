module Silverware

  class Aspect < Base
  end

  class PortAspect < Aspect
    field :port,     Integer
    field :addrs,    Array
    field :protocol, Symbol

    # field :monitor, PortMonitorHint

    def num
      self.port
    end
  end

  class DaemonAspect < Aspect
    field :name, String
    field :user, String
    field :cmd,  String
  end

  class LogAspect
  end

  class PortCollection < Gorillib::ModelCollection
    include Gorillib::Collection::CommonAttrs
    self.item_type = Silverware::PortAspect
    attr_reader :component

    def initialize(component, options={})
      super(options)
      @component = component
      @common_attrs = common_attrs.merge(component: component)
    end
  end

  class DaemonCollection < Gorillib::ModelCollection
    include Gorillib::Collection::CommonAttrs
    self.item_type = Silverware::DaemonAspect
    attr_reader :component

    def initialize(component, options={})
      super(options)
      @component = component
      @common_attrs = common_attrs.merge(component: component)
    end
  end
end
