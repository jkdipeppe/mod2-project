require "rails_helper"

RSpec.describe TicketsController do
  describe "creating a valid ticket and assign to show and guest" do
    let(:first_band) { Band.create(picture: "this is the picture", name: "Hi", genre: "mood", bandmates: "Austin, Kyle", bio: "Best bio ever.", username: "bandusername", password: "bandpassword")}
    let(:first_venue) { Venue.create(name: "BigVenue", location: "Dallas", capacity: 150, cost: 3000) }
    let(:first_guest) { Guest.create(name: "Austin", age: 25, location: "washington", username: "AustinIsCool", password: "ImSuperCool") }
    let(:show) { Show.create(name: "KylesBand", band_id: first_band.id, venue_id: first_venue.id, date: DateTime.now, price: 30) }
    let(:first_ticket) { Ticket.create(show_id: show.id, guest_id: first_guest.id, ticket_type: "VIP", price: 140) }
    let(:ticket_null) { Ticket.create( ticket_type: "VIP", price: 140) }

    it "creates guest successfully" do
      expect(first_guest).to be_a(Guest)
    end
    it "creates ticket successfully" do
      expect(first_ticket).to be_a(Ticket)
    end

    it "does not create" do
      expect(ticket_null).to be_new_record
    end

    it "successfuly loads guests ticket page after creation" do
      expect(response.status).to eq(200)
    end
  end


end
