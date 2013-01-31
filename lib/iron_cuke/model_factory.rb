require 'pp'
module ModelFactory

  def self.generate_model(name,attributes)
    server = ::Silverware::Server.new
    server.name = name
    server.attributes = attributes
    attributes['announces'].values.each do |announcement|
      comp = ::Silverware::Component.receive(announcement.to_hash)
      comp.server = name
      server.components << comp
    end
    return server
  end
end

