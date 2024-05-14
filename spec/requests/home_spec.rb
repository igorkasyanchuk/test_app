require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    it "returns http success", :vcr do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /lookup" do
    it "returns image", :vcr do
      post "/lookup", params: { forms_breed_form: { name: 'hound' } }
      expect(response.body).to include('https://images.dog.ceo/breeds/hound')
    end

    it "returns error if name is empty", :vcr do
      post "/lookup", params: { forms_breed_form: { name: '' } }
      expect(response.body).to include('Name can&#39;t be blank')
    end

    it "returns error if breed not found", :vcr do
      post "/lookup", params: { forms_breed_form: { name: 'NOT_EXISTING' } }
      expect(response.body).to include('not found')
    end

    it "returns error if we have issues with host", :vcr do
      expect_any_instance_of(DogCeo::Client).to receive(:random_image_by_breed).and_raise(Socket::ResolutionError)
      post "/lookup", params: { forms_breed_form: { name: 'hound' } }
      expect(response.body).to include('Network error')
    end
  end
end
