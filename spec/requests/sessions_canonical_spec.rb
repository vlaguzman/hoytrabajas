require "rails_helper"

RSpec.describe "Sign in templete visible with url canonical '/registro/candidato/' and '/registro/empresa/'", type: :request do

  it " Visit hoytrabajas.com/users/sign_in but now available hoytrabajas.com/registro/candidato/" do

    get "/registro/candidato/"

    expect(response).to render_template("devise/sessions/new")

  end

  it " Visit hoytrabajas.com/company/sign_in but now available hoytrabajas.com/registro/empresa/" do

    get "/registro/empresa/"

    expect(response).to render_template("devise/sessions/new")

  end

end
