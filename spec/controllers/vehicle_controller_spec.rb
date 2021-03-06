require 'rails_helper'

RSpec.describe VehiclesController, type: :controller do
  context "when not signed in" do
    describe 'GET #index' do
      before do
        get :index
      end
      it 'returns a status code of 302' do
        expect(response.status).to eq 302
      end

      it 'redirects to login' do
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  context "when already signed in" do
    describe 'GET #index' do
      login_user
      before(:each) do
        get :index
      end

      it 'returns a status code of 200' do
        expect(response.status).to eq 200
      end

      it 'renders new template' do
        expect(response).to render_template(:index)
      end

      it 'uses application layout' do
        expect(response).to render_template('layouts/application')
      end
    end

    describe 'GET #new' do
      login_user
      it 'returns a status code of 200' do
        get :new
        expect(response.status).to eq 200
      end
    end

    describe 'POST #create' do
      before do
        post :create, params: {
          vehicle: attributes_for(:vehicle)
        }
      end

      it 'returns a status code of 302' do
        expect(response.status).to eq 302
      end

      it 'redirects to index' do
        expect(response).to redirect_to vehicles_path
      end
    end
  end

end
