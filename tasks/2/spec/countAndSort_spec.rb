require_relative "../countAndSort"

RSpec.describe CountSorter do
    it "Count matching objects in array and descendingly sort" do
      array1 = [
        'bed', 'pillow', 'bed', 'pillow', 'table', 'bed', 'pillow', 
        'door', 'light', 'minibar', 'light', 'chair', 'chair', 'light', 
        'light', 'hairdryer', 'soap'
      ]
      sorted1 = {"light"=>4, "bed"=>3, "pillow"=>3, "chair"=>2, "table"=>1, "door"=>1, "minibar"=>1, "hairdryer"=>1, "soap"=>1}

      array2 = ['tea', 'burger', 'chip', 'floor', 'burger', 'floor', 'grass']
      sorted2 = {'burger'=>2, 'floor'=>2,'chip'=>1,'grass'=>1 ,'tea'=>1}

      expect(CountSorter.countAndSort(array1)).to eq(sorted1)
      expect(CountSorter.countAndSort(array2)).to eq(sorted2)

      expect(CountSorter.countAndSortSimple(array1)).to eq(sorted1)
      expect(CountSorter.countAndSortSimple(array2)).to eq(sorted2)

    end
end
  