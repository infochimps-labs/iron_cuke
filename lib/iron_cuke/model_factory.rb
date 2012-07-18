require 'pp'
module ModelFactory

  def self.generate_model(node)
    server = ::Silverware::Server.new
    server.name = node.name
    if node[:announces]
      node[:announces].values.each do |announcement|
        comp = ::Silverware::Component.receive(announcement.to_hash)
        server.components << comp
      end
    end 
    return server
  end
end

