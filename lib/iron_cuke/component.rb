module Silverware
  
  # declare the classes so we can refer to them; actual code is below
  class PortCollection      < Gorillib::ModelCollection ; end
  class DaemonCollection    < Gorillib::ModelCollection ; end
  class LogCollection       < Gorillib::ModelCollection ; end
  class DashboardCollection < Gorillib::ModelCollection ; end

  #
  # @example
  #   Silverware::Component.new(:hadoop, :namenode, realm: 'your_mom')
  #
  class Component < Base
    field :sys,       Symbol, position: 0
    field :subsys,    Symbol, position: 1
    field :realm,     Symbol
    field :timestamp, String,         default: ->{ self.class.timestamp }
    
    field :ports,     PortCollection, default: ->{ PortCollection.new(self) }

    # A segmented name for the component, including realm
    # @example
    #   Ironfan::Component.new(rc, :redis, :server, :realm => 'krypton').fullname
    #   # => 'krypton-redis-server'
    #   Ironfan::Component.new(rc, :nfs, nil, :realm => 'krypton').fullname
    #   # => 'krypton-nfs'
    #
    # @return [String] the component's dotted name
    def fullname
      return [self.sys,self.subsys].join('-')
    end

    def receive_ports(ports)
      ports.each do |label, port_info|
        if label.is_a?(Integer) or port_info.is_a?(Integer) then
          warn "Bogus (numeric) port #{label} in #{self}; skipping"
          next
        end
        port_aspect = PortAspect.receive(port_info.to_hash.merge(name: label))
        self.ports[label] = port_aspect
      end
    end
  end

  class Server
    attr_accessor :name
    attr_accessor :components
    
    def initialize
      @components = []
      super
    end
  end
end
