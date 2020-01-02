require 'rails_helper'

RSpec.describe "users/profiles/show" do
  let!(:user) { create(:user) }
  it "Should render users/profiles#show template" do
    assign(:user, Users::ProfilesPresenter.new(user))

    render
  end
end
