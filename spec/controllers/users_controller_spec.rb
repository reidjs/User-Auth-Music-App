require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of user's email and password" do
        post :create, params: { "user[email]" => "", "user[password]" => ""}
        # expect(response).not_to be_success
        expect(response).to render_template("new")
      end
      it "validates that the password is at least 6 chars long" do
        post :create, params: {'user[email]' => 'reid@gmail.com', 'user[password]' => '123'}
        # expect(response).not_to be_success
        expect(response).to render_template("new")
      end

    end
    context "with valid params" do
      it "redirects user to bands index on success" do
        post :create, params: {'user[email]' => 'reid@gmail.com', 'user[password]' => 'password'}
        expect(response).to redirect_to(user_url(User.find_by(email: 'reid@gmail.com').id))

      end
    end
  end
  describe "GET #show" do
    it "renders show page" do
      User.create!(email: 'testemail@123.com', password: 'password' )
      get :show, params: { 'id' => User.first.id }
      expect(response).to render_template("show")
    end
  end
end
