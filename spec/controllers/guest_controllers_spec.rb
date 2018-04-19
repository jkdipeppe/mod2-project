require "rails_helper"

RSpec.describe GuestsController do
  describe "creating a valid guest" do
    # let(:first_band) { Band.create(picture: "this is the picture", name: "Hi", genre: "mood", bandmates: "Austin, Kyle", bio: "Best bio ever.", username: "bandusername", password: "bandpassword")}
    # let(:first_venue) { Venue.create(name: "BigVenue", location: "Dallas", capacity: 150, cost: 3000) }
    let(:first_guest) { Guest.create(name: "Austin", age: 25, location: "washington", username: "AustinIsCool", password: "ImSuperCool") }

    it "creates guest successfully" do
      expect(first_guest).to be_a(Guest)
    end

    it "successfuly loads guest page after creation" do
      expect(response.status).to eq(200)
    end
  end


end
