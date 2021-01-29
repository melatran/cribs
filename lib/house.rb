class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.gsub(/\$/,'').to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(type_of_room)
    room_type = []
    @rooms.find_all do |room|
      if room.category == type_of_room
        room_type << room
      end
    end
    room_type
  end

  def area
    @rooms.sum {|room| room.area}
  end

  def details
    info = Hash.new
    info["price"] = @price
    info["address"] = @address
    info
  end

  def price_per_square_foot
    (@price.to_f / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort {|room| room.area } 
  end

  def rooms_by_category
    @rooms.group_by {|room| room.category }
  end
end