module Silverware
  class Base
    include Gorillib::Model

    # A compact timestamp, to record when services are registered
    def self.timestamp
      Time.now.utc.strftime("%Y%m%d%H%M%SZ")
    end
  end
end
