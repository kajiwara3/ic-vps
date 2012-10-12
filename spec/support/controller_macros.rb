module ControllerMacros
  def login_user
    before(:each) do
      @request.env["device.mapping"] = Devise.mappings[:partner]
      sign_in FactoryGirl.create(:partner)
    end
  end
end