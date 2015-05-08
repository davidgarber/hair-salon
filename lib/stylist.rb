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

  define_method(:==) do |other_stylist|
    self.name().==(other_stylist.name()).&(self.stylist_id().==(other_stylist.stylist_id()))
  end

  define_method(:save) do
    DB.exec("INSERT INTO stylists (name, stylist_id) VALUES ('#{@name}', #{@stylist_id});")
  end

  define_singleton_method(:find) do |stylist_id|
    found_list = nil
    Stylist.all().each() do |list|
      if list.stylist_id().==(stylist_id)
        found_list = list
      end
    end
    found_list
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @stylist_id = self.stylist_id()
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE stylist_id = #{@stylist_id}")
    end

  define_method(:clients) do
    stylist_clients = []
    results = DB.exec("SELECT client_id FROM stylists_clients WHERE stylist_id = #{self.stylist_id()};")
    results.each() do |result|
      client_id = result.fetch('client_id').to_i()
      client = DB.exec("SELECT * FROM clients WHERE id = #{client_id};")
      name = client.first().fetch('client')
      stylist_clients.push(Client.new({:name => name, :client_id => client_id}))
    end
    stylist_clients
  end
end
