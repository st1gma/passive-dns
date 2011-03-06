require 'helper'

class TestPassiveDnsQuery < Test::Unit::TestCase
	should "instantiate BFK Client" do
		assert_not_nil(PassiveDNS::BFKClient.new) 
	end

	should "instantiate DNSParse Client" do
		assert_not_nil(PassiveDNS::DNSParse.new)
	end
	
	should "instantiate ISC Client" do
		assert_not_nil(PassiveDNS::ISC.new)
	end
	
	should "instantiate CERT-EE Client" do
		assert_not_nil(PassiveDNS::CERTEE.new)
	end
	
	should "instantiate Passive DNS State" do
		assert_not_nil(PassiveDNS::PDNSToolState.new)
	end
	
	should "instantiate Passive DNS State database" do
		if File.exists?("test/test.sqlite3")
			File.unlink("test/test.sqlite3")
		end
		assert_not_nil(PassiveDNS::PDNSToolStateDB.new("test/test.sqlite3"))
		if File.exists?("test/test.sqlite3")
			File.unlink("test/test.sqlite3")
		end
	end
	
	should "query BFK" do
		rows = PassiveDNS::BFKClient.new.lookup("example.org");
		assert_not_nil(rows)
		assert_not_nil(rows.to_s)
		assert_not_nil(rows.to_xml)
		assert_not_nil(rows.to_json)
		assert_not_nil(rows.to_yaml)
	end
	
	should "query DNSParse" do
		rows = PassiveDNS::DNSParse.new.lookup("example.org");
		assert_not_nil(rows)
		assert_not_nil(rows.to_s)
		assert_not_nil(rows.to_xml)
		assert_not_nil(rows.to_json)
		assert_not_nil(rows.to_yaml)
	end

	should "query ISC" do
		rows = PassiveDNS::ISC.new.lookup("example.org");
		assert_not_nil(rows)
		assert_not_nil(rows.to_s)
		assert_not_nil(rows.to_xml)
		assert_not_nil(rows.to_json)
		assert_not_nil(rows.to_yaml)
	end

	should "query CERTEE" do
		rows = PassiveDNS::CERTEE.new.lookup("example.org");
		assert_not_nil(rows)
		assert_not_nil(rows.to_s)
		assert_not_nil(rows.to_xml)
		assert_not_nil(rows.to_json)
		assert_not_nil(rows.to_yaml)
	end

end
