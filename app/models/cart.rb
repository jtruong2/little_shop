class Cart
attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def total_count
    contents.values.sum
  end

  def add_item(id)
    contents[id.to_s] = (contents[id.to_s] || 0) + 1
  end

  def count_of(id)
    contents[id.to_s].to_i
  end
   def items
     contents.keys.map do |key|
       Item.find(key)
     end
   end

   def remove_item(id)
     id = id.to_s
     contents[id] = (contents[id] - 1)
     if contents[id] == 0
       contents.delete(id)
     end
   end

   def quantity(item)
    contents[item.id.to_s]
   end
end
