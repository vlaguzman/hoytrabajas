require "rails_helper"

RSpec.describe "Offers templete visible with url canonical '/ofertas-de-empleo' or '/buscador-de-empleo'", type: :request do

  it " Visit hoytrabajas.com/offers but now available hoytrabajas.com/ofertas-de-empleo" do

    get "/ofertas-de-empleo/"

    expect(response).to render_template("offers/index")

  end

  it " Visit hoytrabajas.com/offers but now available hoytrabajas.com/buscador-de-empleo" do

    get "/buscador-de-empleo/"

    expect(response).to render_template("offers/index")

  end
end
