require 'rails_helper'
describe CreditsController do
  let(:user) { create(:user) }
  
  describe 'GET #new' do
    context 'login時' do
      before do
        login_user user
      end
      it "newアクション" do
        allow(Payjp::Customer).to receive(:create).and_return(PayjpMock.prepare_customer_information)
        user.credit = create(:credit, user_id: user.id)
        get :new
        expect(response).to redirect_to(credits_path)
      end
    end
  end

  describe 'GET #index' do
    context 'login時' do
      before do
        login_user user
      end
      it "indexアクション" do
        credit = create(:credit, user_id: user.id)
        allow(Payjp::Customer).to receive(:create).and_return(PayjpMock.prepare_customer_information)
        get :index, params: {id: credit}
        expect(assigns(:credit)).to eq credit
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'login時' do
      before do
        login_user user
      end
      it "destroyアクション" do
        credit = create(:credit, user_id: user.id)
        delete :destroy, params: {id: credit}
      end
    end
  end

end