require 'spec_helper'

describe(Client) do

  describe("#name") do
    it('returns the name of the client') do
      test_client = Client.new({:name => 'Julie', :id => 1})
      expect(test_client.name()).to(eq('Julie'))
    end
  end
end
