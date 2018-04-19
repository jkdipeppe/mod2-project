require "rails_helper"

RSpec.describe ShowsController do
  describe "creating a valid show, band and venue" do
    let(:first_band) { Band.create(picture: "this is the picture", name: "Hi", genre: "mood", bandmates: "Austin, Kyle", bio: "Best bio ever.", username: "bandusername", password: "bandpassword")}
    let(:first_venue) { Venue.create(name: "BigVenue", location: "Dallas", capacity: 150, cost: 3000) }
    let(:show_found) { Show.create(name: "KylesBand", band_id: first_band.id, venue_id: first_venue.id, date: DateTime.now, price: 30) }

    it "creates show successfully" do
      expect(show_found).to be_a(Show)
    end

    it "creates band successfully" do
      expect(first_band).to be_a(Band)
    end

    it "creates venue successfully" do
      expect(first_venue).to be_a(Venue)
    end


    it "successfuly loads show page after creation" do
      expect(response.status).to eq(200)
    end
  end


end
