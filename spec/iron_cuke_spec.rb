require_relative './spec_helper'
require 'iron_cuke'

describe IronCuke do
  let(:announces) { JSON.parse(File.read("spec/announces.json")) }
  let(:empty_component) {{"sys"=>"nfs", "subsys"=>"home", "name"=>"nfs_home", "realm"=>"p1cimaster_control", "daemons"=>{}, "ports"=>{}, "logs"=>{}}}
  let(:mongo_component) {announces["p1cimaster_control-mongo-0"]["p1cimaster_control-mongodb-server"]}

  describe IronCuke::Proctor::LogsProctor do
    let(:log_proctor) { IronCuke::Proctor.proctor_for("logs") }

    it 'loads the correct proctor class' do
      log_proctor.class.should == IronCuke::Proctor::LogsProctor
    end

    it 'skips log components that are incomplete' do
      log_proctor.will_write?(empty_component).should == false
    end

    it 'will write a present log component' do
      log_proctor.will_write?(mongo_component).should == true
    end

    it 'cucumber test output contains log component' do
      log_proctor.write_test(mongo_component).should =~ /\/var\/log\/mongodb\/mongodb.log/
    end

  end

  describe IronCuke::Proctor::PortsProctor do
    let(:ports_proctor) { IronCuke::Proctor.proctor_for("ports") }

    it 'loads the correct proctor class' do
      ports_proctor.class.should == IronCuke::Proctor::PortsProctor
    end

    it 'skips port components that are incomplete' do
      ports_proctor.will_write?(empty_component).should == false
    end

    it 'will write a present port component' do
      ports_proctor.will_write?(mongo_component).should == true
    end

    it 'cucumber test output contains port component' do
      ports_proctor.write_test(mongo_component).should =~ /27017/
    end

  end

  describe IronCuke::Proctor::DaemonsProctor do
    let(:daemons_proctor) { IronCuke::Proctor.proctor_for("daemons") }

    it 'loads the correct proctor class' do
      daemons_proctor.class.should == IronCuke::Proctor::DaemonsProctor
    end

    it 'skips daemon components that are incomplete' do
      daemons_proctor.will_write?(empty_component).should == false
    end

    it 'will write a present daemon component' do
      daemons_proctor.will_write?(mongo_component).should == true
    end

    it 'cucumber test output contains daemon component' do
      daemons_proctor.write_test(mongo_component).should =~ /| mongod | mongodb | mongod |/
    end

  end

  describe "DaemonServiceProctor" do
    let(:daemons_proctor) { IronCuke::Proctor.proctor_for("daemons") }

    let(:announces) { JSON.parse(File.read("spec/service_announces.json")) }
    let(:splunk_web_component) { announces["p1master-control-splunk-0"]["p1master-splunk-web"] }

    it 'will write a present daemon component' do
      daemons_proctor.will_write?(splunk_web_component).should == true
    end

    it 'cucumber test output contains daemon service component' do
      daemons_proctor.write_test(splunk_web_component).should =~ /sudo service splunk_web status/
    end


  end

end
