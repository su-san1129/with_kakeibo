# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe 'index' do
    context 'indexページが正しく表示される' do
      before do
        login_user user
        get :index
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe 'show' do
    # 正常なレスポンスか？
    before do
      login_user user
      get :show, params: { id: user }
    end

    it 'showページが正しく表示される' do
      expect(response).to be_success
    end
    # 200レスポンスが返ってきているか？
    it 'リクエストは200 OKとなること' do
      expect(response).to have_http_status '200'
    end
  end
end
