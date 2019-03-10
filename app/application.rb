
class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      #item_name is an array of names that after split from the /items/
      if item = @@items.find {|t| t.name == item_name}
        #item will find the first object that name matches with the item_name
        resp.write item.price
        # return the price of the item object
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
