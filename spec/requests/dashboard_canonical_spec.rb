require "rails_helper"

RSpec.describe "Dashboard templete visible with url canonical '/panel/candidato/' and '/panel/empresa/'", type: :request do

  it " Visit hoytrabajas.com/users/dashsboards but now available hoytrabajas.com/panel/candidato/" do
    user = create(:user)

    sign_in user

    get "/panel/candidato/"

    expect(response).to render_template("users/dashboards/show")

  end

  it " Visit hoytrabajas.com/company/dashboards but now available hoytrabajas.com/panel/empresa/" do
    company = create(:company)

    sign_in company

    get "/panel/empresa/"

    expect(response).to render_template("companies/dashboards/show")

  end

end
