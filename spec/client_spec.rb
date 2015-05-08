require 'spec_helper'

describe(Client) do

  describe("#name") do
    it('returns the name of the client') do
      test_client = Client.new({:name => 'Julie', :client_id => 1})
      expect(test_client.name()).to(eq('Julie'))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end


  describe("#==") do
    it("is the same client if it is the same name and client_id") do
      client1 = Client.new({:name => "Julie", :client_id => 1})
      client2 = Client.new({:name => "Julie", :client_id => 1})
      expect(client1).to(eq(client2))
    end
  end


    describe("#client_id") do
      it("lets you read the client ID out") do
        test_client = Client.new({:name => "Julie", :client_id => 1})
        expect(test_client.client_id).to(eq(1))
      end
    end

  describe("#save") do
    it("adds a client to the array of saved clients") do
      test_client = Client.new({:name => "Julie", :client_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe(".find") do
    it("returns a client by their client_id") do
      test_client = Client.new({:name => "Sarah", :client_id => 1})
      test_client.save()
      test_client2 = Client.new({:name => "Mary", :client_id => 1})
      test_client2.save()
      expect(Client.find(test_client2.client_id())).to(eq(test_client2))
    end
  end

  describe("#update") do
  it("lets you update clients in the database") do
    clients = Client.new({:name => "Sarah", :client_id => 1})
    clients.save()
    clients.update({:name => "Fred"})
    expect(clients.name()).to(eq("Fred"))
  end
end

  describe("#delete") do
    it("lets you delete a client from the database") do
      client1 = Client.new({:name => "Michael", :client_id => 1})
      client1.save()
      client2 = Client.new({:name => "Steven", :client_id => 1})
      client2.save()
      client1.delete()
      expect(Client.all()).to(eq([client2]))
    end
  end

end
