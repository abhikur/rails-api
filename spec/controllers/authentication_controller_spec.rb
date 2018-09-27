require 'rails_helper'

RSpec.describe AuthenticationController, type: @controller do
  describe "#authenticate" do
    before do
      @user = create(:user, name: "username", password: "password")
    end
    it "returns error is username or password is not passed" do
      post :authenticate, {:username => 'username'}

      expect(response).to have_http_status(:error)
    end
    it "should return json response when username and password are passed" do
      post :authenticate, {:username => 'username', :password=>'password'}

      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json_response.keys.size).to eq(16)
      expect(json_response.keys).to match_array(%w(preferred_name deny_login company title vendor_person_id username
      last_replicated_at failed_login_count email_addresses first_name last_name locked_at groups eid needs_to_change_password fmno))
    end
  end
end
