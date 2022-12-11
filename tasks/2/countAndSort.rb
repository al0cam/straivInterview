array = [
    'bed', 'pillow', 'bed', 'pillow', 'table', 'bed', 'pillow', 
    'door', 'light', 'minibar', 'light', 'chair', 'chair', 'light', 
    'light', 'hairdryer', 'soap'
]

module CountSorter
    def self.countAndSort(array)
        map = Hash[]
        array.each do |element|
            if map.has_key?(element)
                map[element] += 1
            else
                map[element] = 1
            end
        end
        map = map.sort_by{|key,value| -value}.to_h
    end

    def self.countAndSortSimple(array)
        array.group_by{|item| item}.map{|key,value| [key,value.length]}.to_h
    end
end
