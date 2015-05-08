require('spec_helper')

describe(Stylist) do

  describe("#name") do
    it("returns the name of the stylist's name") do
      test_stylist = Stylist.new({:name => "Sarah", :stylist_id => 1})
      expect(test_stylist.name()).to(eq("Sarah"))
    end
  end

  describe("#stylist_id") do
    it("returns the value of stylist_id") do
      test_stylist = Stylist.new({:name => "Sarah", :stylist_id => 1})
      expect(test_stylist.stylist_id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same stylist if it is the same name and stylist_id") do
      stylist1 = Stylist.new({:name => "Julie", :stylist_id => 1})
      stylist2 = Stylist.new({:name => "Julie", :stylist_id => 1})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe("#save") do
    it("adds a stylist to the array of saved stylists") do
      test_stylist = Stylist.new({:name => "Sarah", :stylist_id => 1})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end
end
