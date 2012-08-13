require_relative './spec_helper'
require 'iron_cuke'

describe IronCuke do
  it 'loads silverware classes' do
    Silverware.constants.should == [
      :Base, :Aspect, :PortAspect, :DaemonAspect, :LogAspect, :PortCollection, :DaemonCollection, :LogCollection, :DashboardCollection, :Component, :Server
    ]
  end
end
