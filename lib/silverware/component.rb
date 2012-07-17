# lib/silverware/component.rb
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

    # The actual chef node this component belongs to
    attr_accessor     :node

    # A segmented name for the component, including realm
    # @example
    #   Ironfan::Component.new(rc, :redis, :server, :realm => 'krypton').fullname
    #   # => 'krypton-redis-server'
    #   Ironfan::Component.new(rc, :nfs, nil, :realm => 'krypton').fullname
    #   # => 'krypton-nfs'
    #
    # @return [String] the component's dotted name
    def fullname
      self.class.fullname(realm, sys, subsys)
    end

    def receive_ports(ports)
      ports.each do |port|
        if port.is_a?(Integer) then
          warn "Bogus (numeric) port #{port} in #{self}; skipping"
          next
        end
        self.ports.receive_item(port)
      end
    end
  end
end
