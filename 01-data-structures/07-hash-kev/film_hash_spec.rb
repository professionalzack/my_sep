include RSpec

require_relative 'film_hash'

RSpec.describe BaconHunt, type: Class do
  let (:hunt) { BaconHunt.new }
  let (:keanu) { Actor.new("Keanu Reeves") }
  let (:swayze) { Actor.new("Patrick Swayze") }
  let (:whoopi) { Actor.new("Whoopi Goldberg") }
  let (:kevin) { Actor.new("Kevin Bacon") }
  let (:martha) { Actor.new("Martha Stewart") }
  let (:tommy) { Actor.new("Tommy Lee Jones") }
  let (:nun) { Actor.new("Some Nun") }
  let (:father) { Actor.new("Someone's Dad") }
  let (:simba) { Actor.new("Simba") }
  let (:timon) { Actor.new("Timon") }
  let (:scar) { Actor.new("Scar") }
  let (:townies) { Actor.new("The Athenians") }
  let (:point_break) { Film.new("Point Break") }
  let (:ghost) { Film.new("Ghost") }
  let (:mib) { Film.new("Men in Black II") }
  let (:jfk) { Film.new("JFK") }
  let (:sister) { Film.new("Sister Act II") }
  let (:music) { Film.new("Sound of Music") }
  let (:lion) { Film.new("Lion King") }
  let (:athens) { Film.new("Timon of Athens") }



  describe "#introduce(actor)" do
    it "properly introduces a new actor into the hunt" do
      hunt.introduce(keanu)
      p hunt
      expect(hunt.actors[0].name).to eq "Keanu Reeves"
    end

    it "properly introduces a new actor into the hunt" do
      hunt.introduce(keanu)
      hunt.introduce(swayze)
      expect(hunt.actors[1].name).to eq "Patrick Swayze"
    end

	end
  describe "validate_career(actor, film)" do
    it "adds a film to the actor's career" do
      hunt.introduce(keanu)
      hunt.validate_career(keanu, point_break)
      expect(keanu.career[0].title).to eq "Point Break"
    end

    it "adds an actor to the film's cast" do
      hunt.introduce(keanu)
      hunt.validate_career(keanu, point_break)
      expect(point_break.cast[0].name).to eq "Keanu Reeves"
    end

  end

  describe "find_kevin_bacon(actor)" do
    it "returns kevin bacon if kevin bacon is argued" do
      hunt.introduce(kevin)
      hunt.validate_career(kevin, jfk)
      expect(hunt.find_kevin_bacon(kevin)).to eq @movies
    end

    it "adds called actor to the list of outmoded actors" do
      hunt.introduce(swayze)
      hunt.validate_career(swayze, point_break)
      hunt.validate_career(swayze, ghost)
      hunt.find_kevin_bacon(swayze)
      expect(hunt.outmoded_actors[0].name).to eq "Patrick Swayze"
    end

    it "illuminates the career of argued actor" do
      hunt.introduce(swayze)
      hunt.introduce(keanu)
      hunt.introduce(whoopi)
      hunt.validate_career(keanu, point_break)
      hunt.validate_career(swayze, point_break)
      hunt.validate_career(swayze, ghost)
      hunt.validate_career(whoopi, ghost)
      expect(hunt.find_kevin_bacon(swayze)).to eq "Patrick Swayze"
    end

    it "finds kevin bacon" do
      hunt.introduce(kevin)
      hunt.introduce(martha)
      hunt.introduce(tommy)
      hunt.validate_career(martha, mib)
      hunt.validate_career(tommy, mib)
      hunt.validate_career(tommy, jfk)
      hunt.validate_career(kevin, jfk)
      expect(hunt.find_kevin_bacon(martha)).to eq martha.name
    end

    it "fails to find kevin bacon" do
      hunt.introduce(kevin)
      hunt.introduce(swayze)
      hunt.introduce(keanu)
      hunt.introduce(whoopi)
      hunt.introduce(nun)
      hunt.introduce(father)
      hunt.introduce(simba)
      hunt.introduce(timon)
      hunt.introduce(townies)
      hunt.introduce(scar)
      hunt.validate_career(keanu, point_break)
      hunt.validate_career(swayze, point_break)
      hunt.validate_career(swayze, ghost)
      hunt.validate_career(whoopi, ghost)
      hunt.validate_career(nun, sister)
      hunt.validate_career(nun, music)
      hunt.validate_career(father, music)
      hunt.validate_career(whoopi, sister)
      hunt.validate_career(father, lion)
      hunt.validate_career(timon, lion)
      hunt.validate_career(scar, lion)
      hunt.validate_career(timon, athens)
      hunt.validate_career(townies, athens)
      expect(hunt.find_kevin_bacon(keanu)).to eq keanu.name
    end


  end

  describe "#print" do
     specify {
        expected_output = "Keanu Reeves: Point Break\nPatrick Swayze: Point Break\nWhoopi Goldberg: Ghost\nKevin Bacon: JFK\nMartha Stewart: Men in Black II\nTommy Lee Jones: Men in Black II\n"
        hunt.introduce(keanu)
        hunt.introduce(swayze)
        hunt.introduce(whoopi)
        hunt.introduce(kevin)
        hunt.introduce(martha)
        hunt.introduce(tommy)
        hunt.validate_career(keanu, point_break)
        hunt.validate_career(swayze, point_break)
        hunt.validate_career(swayze, ghost)
        hunt.validate_career(whoopi, ghost)
        hunt.validate_career(martha, mib)
        hunt.validate_career(tommy, mib)
        hunt.validate_career(tommy, jfk)
        hunt.validate_career(kevin, jfk)
        expect { hunt.print }.to output(expected_output).to_stdout
     }

  end
end
