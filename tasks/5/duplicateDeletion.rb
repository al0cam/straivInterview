class Entry
    attr_accessor :name
    attr_reader :id, :created_at
    
    def initialize(id, name, created_at)
        @id = id
        @name = name
        @created_at = created_at
    end

    def to_s
        return "#{@id} #{@name} #{@created_at}"
    end
end

class Table
    attr_reader :entries
    def initialize()
        @entries = []
    end

    def << (entry)
        @entries << entry
    end

    def remove_duplicates()
        if check_for_duplicates?
            @entries.map!{|item| (has_duplicate?(item)? latest_entry(item) : item)}
            @entries.uniq!
            puts "duplicates removed"
        else 
            puts "no duplicates"
        end
    end

    def print
        @entries.each{|item| puts item.to_s}
    end

    private

    def check_for_duplicates?
        @entries.each do |entry|
            has_duplicate?(entry)
        end
    end

    def has_duplicate?(entry)
        @entries.count{|item| item.name == entry.name} > 1
    end

    def latest_entry(entry)
        latest = entry
        @entries.each{|item| latest = item if item.name == entry.name && item.created_at >= latest.created_at }
        return latest
    end

end

table = Table.new;
table<<(Entry.new(1,"diego",Time.now.ctime))
table<<(Entry.new(2,"marcus",Time.now.ctime))
table<<(Entry.new(3,"cicero",Time.now.ctime))
table<<(Entry.new(4,"stjepan",Time.now.ctime))
table<<(Entry.new(5,"stjepan",Time.now.ctime))
sleep(0.3)
table<<(Entry.new(6,"marcus",Time.now.ctime))
sleep(0.9)
table<<(Entry.new(7,"marcus",Time.now.ctime))

table.print

table.remove_duplicates

table.print