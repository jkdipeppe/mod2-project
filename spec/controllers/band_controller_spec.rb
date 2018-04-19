require "rails_helper"

RSpec.describe BandsController do
  describe "creating a valid author" do
    let(:show_found) { Show.find_by(name: "Gold duplication") }

    before { post :create, name: "Gold duplication", band_id: 5, vend_id: 7 }

    it "creates successfully" do
      expect(show_found).to be_a(Show)
    end

    it "redirects to show page" do
      expect(response).to redirect_to(show_path(show_found))
    end
  end
end
