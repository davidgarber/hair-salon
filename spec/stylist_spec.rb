require('spec_helper')

describe(Stylist) do

  describe("#name") do
    it("returns the name of the stylist's name") do
      test_stylist = Stylist.new({:name => "Sarah", :stylist_id => 1})
      expect(test_stylist.name()).to(eq("Sarah"))
    end
  end
end
