class Client
  attr_reader(:name, :client_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @client_id = attributes.fetch(:client_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      name = client.fetch("name")
      client_id = client.fetch("client_id").to_i()
      clients.push(Client.new({:name => name, :client_id => client_id}))
    end
    clients
  end

  define_method(:==) do |other_client|
    self.name().==(other_client.name()).&(self.client_id().==(other_client.client_id()))
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (name, client_id) VALUES ('#{@name}', #{@client_id});")
  end

  define_singleton_method(:find) do |client_id|
    found_list = nil
    Client.all().each() do |list|
      if list.client_id().==(client_id)
        found_list = list
      end
    end
    found_list
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @client_id = self.client_id()
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE client_id = #{@client_id}")
    end
end
