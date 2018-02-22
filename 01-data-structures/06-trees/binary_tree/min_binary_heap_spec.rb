include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:tree) { MinBinaryHeap.new }
  let (:matrix) { Node.new("The Matrix", 87) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node into heap" do
      tree.insert(pacific_rim)
      expect(tree.items[0].title).to eq "Pacific Rim"
    end

    it "properly inserts a new node into the heap" do
      tree.insert(braveheart)
      tree.insert(pacific_rim)
      expect(tree.items[1].title).to eq "Braveheart"
    end

    it "properly inserts a new node in its correct place" do
      tree.insert(district)
      tree.insert(inception)
      expect(tree.items[1].title).to eq "District 9"
    end
	end
  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(empire)
      tree.insert(mad_max_2)
      expect(tree.find(nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(pacific_rim)
      expect(tree.find(pacific_rim).title).to eq "Pacific Rim"
    end

    it "properly finds a left-left node" do
      tree.insert(braveheart)
      tree.insert(pacific_rim)
      expect(tree.find(pacific_rim).title).to eq "Pacific Rim"
    end

  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(hope)
      tree.delete(hope)
      expect(tree.find(hope)).to be_nil
    end

    it "properly deletes a left-left node" do
      tree.insert(braveheart)
      tree.insert(pacific_rim)
      tree.delete(pacific_rim)
      expect(tree.find(pacific_rim)).to be_nil
    end

    it "properly deletes a left-right node" do
      tree.insert(donnie)
      tree.insert(inception)
      tree.delete(inception)
      expect(tree.find(inception)).to be_nil
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nInception: 86\nStar Wars: Return of the Jedi: 80\nDistrict 9: 90\nThe Martian: 92\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
       tree.insert(hope)
       tree.insert(empire)
       tree.insert(jedi)
       tree.insert(martian)
       tree.insert(pacific_rim)
       tree.insert(inception)
       tree.insert(braveheart)
       tree.insert(shawshank)
       tree.insert(district)
       tree.insert(mad_max_2)
       expect { tree.print }.to output(expected_output).to_stdout
     }

  end
end
