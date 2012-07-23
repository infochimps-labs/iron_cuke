require 'pp'
module ModelFactory

  def self.generate_model(name,announces)
    server = ::Silverware::Server.new
    server.name = name
    announces.values.each do |announcement|
      comp = ::Silverware::Component.receive(announcement.to_hash)
      comp.server = name
      server.components << comp
    end
    return server
  end
end

