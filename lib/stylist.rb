class Stylist

  attr_reader(:name, :stylist_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each do |stylist|
      name = stylist.fetch("name")
      client_id = stylist.fetch("stylist_id").to_i()
      stylists.push(Stylist.new({:name => name, :stylist_id => client_id}))
    end
    stylists
  end

end
