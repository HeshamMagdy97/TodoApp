require 'rails_helper'

RSpec.describe "Todos", type: :request do
  describe "GET /users/:user_id/todos" do
    it "works! (now write some real specs)" do
      get '/users/1/todos'
      expect(response).to have_http_status(200)
    end
  end
end
#get :index, params: { user_id: 1.to_s }