require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	let(:user) { create(:user) }

  describe 'ユーザーshow' do
    context "ユーザーshowページが正しく表示される" do
      before do
      	login_user user
        get :index
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
end