module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      sign_in user
    end
  end

  def stub_current_user_account(account)
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user.account).and_return(account)
  end
end