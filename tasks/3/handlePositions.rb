class Table
    attr_reader :entries
    def initialize()
        @entries = []
    end

    def add_entry (id, name)
        @entries << Entry.new(id,name, get_last_position+1)
    end

    def remove_entry(id)
        @entries.delete_if{|item| item.id == id}
        update_positions()
    end

    def print
        @entries.each{|item| puts item.to_s}
    end

    private

    def get_last_position()
        @entries.size
    end

    def update_positions()
        @entries.size.times{|index| @entries[index].position = index+1}
    end

    class Entry
        attr_accessor :name, :position
        attr_reader :id
        
        def initialize(id, name, position)
            @id = id
            @name = name
            @position = position
        end
    
        def to_s
            return "#{@id} #{@name} #{@position}"
        end
    
    end

end

table = Table.new;
table.add_entry(1,"Weather")
table.add_entry(13,"Portfolio")
table.add_entry(29,"Points of interest")
table.add_entry(4,"Events")
table.add_entry(7,"News")
table.add_entry(9,"Check-in")

table.add_entry(230,"About")

table.print
table.remove_entry(4)
puts

puts "new array"

table.print