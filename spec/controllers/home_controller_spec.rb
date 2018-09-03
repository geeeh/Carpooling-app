require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  context "when not signed in" do
    describe 'GET #index' do
      before(:each) do
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
      let(:account) { create(:account) }
      before(:each) do
        get :index
      end

      it 'returns a status code of 200' do
        expect(response.status).to eq 302
      end

      it 'redirects to account path' do
        expect(response).to redirect_to account_index_path
      end
      context 'when user has an account already' do
        before do
          stub_current_user_account(account)
          # post account_index_path, params: {
          #   account: attributes_for(:account)
          # }
        end
        it 'renders index template' do
          expect(response).to render_template(:index)
        end

        it 'uses application layout' do
          expect(response).to render_template('layouts/application')
        end
      end
    end

    describe 'POST #search' do
      login_user
      let(:ride) { create(:ride) }

      before do
        post :create, params: {
          search: { origin: ride.origin, destination: ride.destination }
        }
      end
      it 'returns a status code of 302' do
        expect(response.status).to eq 302
      end

      it 'returns a status code of 302' do
        expect(response).to redirect_to home_index_path
      end

    end
  end

end
