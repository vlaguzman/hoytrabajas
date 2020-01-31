require "rails_helper"

RSpec.describe "Offers templete visible with url canonical '/ofertas-de-empleo' or '/buscador-de-empleo'", type: :request do

  it "Visit hoytrabajas.com/offers but now available hoytrabajas.com/ofertas-de-empleo" do

    get "/ofertas-de-empleo/"

    expect(response).to redirect_to("/offers")

  end

  it "Visit hoytrabajas.com/offers but now available hoytrabajas.com/buscador-de-empleo" do

    get "/buscador-de-empleo/"

    expect(response).to redirect_to("/offers")

  end

  describe "When visit '/ofertas-empleo'" do
    it "Should be redirecto /offers" do
      get "/ofertas-empleo"

      expect(response).to redirect_to("/offers")
    end
  end

  describe "When visit '/ofertas-empleo/servicios-generales-limpieza'" do
    it "Should be redirecto /offers/job_categories/servicios-generales-y-limpieza" do
      get "/ofertas-empleo/servicios-generales-limpieza"

      expect(response).to redirect_to("/offers/job_categories/servicios-generales-y-limpieza")
    end
  end

  describe "When visit '/ofertas-empleo/ventas-comercial'" do
    it "Should be redirecto /offers/job_categories/ventas-y-comercial" do
      get "/ofertas-empleo/ventas-comercial"

      expect(response).to redirect_to("/offers/job_categories/ventas-y-comercial")
    end
  end

  describe "When visit '/ofertas-empleo/gestion-administrativa'" do
    it "Should be redirecto /offers/job_categories/gestion-administrativa" do
      get "/ofertas-empleo/gestion-administrativa"

      expect(response).to redirect_to("/offers/job_categories/gestion-administrativa")
    end
  end

  describe "When visit '/ofertas-empleo/operario'" do
    it "Should be redirecto /offers/job_categories/operario" do
      get "/ofertas-empleo/operario"

      expect(response).to redirect_to("/offers/job_categories/operario")
    end
  end

  describe "When visit '/ofertas-empleo/logistica-transporte'" do
    it "Should be redirecto /offers/job_categories/logistica-y-transporte" do
      get "/ofertas-empleo/logistica-transporte"

      expect(response).to redirect_to("/offers/job_categories/logistica-y-transporte")
    end
  end

  describe "When visit '/ofertas-empleo/belleza-bienestar-salud'" do
    it "Should be redirecto /offers/job_categories/belleza,-bienestar-y-salud" do
      get "/ofertas-empleo/belleza-bienestar-salud"

      expect(response).to redirect_to("/offers/job_categories/belleza,-bienestar-y-salud")
    end
  end

  describe "When visit '/ofertas-empleo/cocina-bar-meseros'" do
    it "Should be redirecto /offers/job_categories/cocina,-bar-y-meseros" do
      get "/ofertas-empleo/cocina-bar-meseros"

      expect(response).to redirect_to("/offers/job_categories/cocina,-bar-y-meseros")
    end
  end

  describe "When visit '/ofertas-empleo/tecnologia-programacion'" do
    it "Should be redirecto /offers/job_categories/tecnologia-y-programacion" do
      get "/ofertas-empleo/tecnologia-programacion"

      expect(response).to redirect_to("/offers/job_categories/tecnologia-y-programacion")
    end
  end

  describe "When visit '/ofertas-empleo/markeing-diseno-publicidad'" do
    it "Should be redirecto /offers/job_categories/marketing,-diseno-y-publicidad" do
      get "/ofertas-empleo/markeing-diseno-publicidad"

      expect(response).to redirect_to("/offers/job_categories/marketing,-diseno-y-publicidad")
    end
  end

  describe "When visit '/ofertas-empleo/eventos-protocolo'" do
    it "Should be redirecto /offers/job_categories/eventos-y-protocolo" do
      get "/ofertas-empleo/eventos-protocolo"

      expect(response).to redirect_to("/offers/job_categories/eventos-y-protocolo")
    end
  end

  describe "When visit '/ofertas-empleo/seguridad'" do
    it "Should be redirecto /offers/job_categories/seguridad" do
      get "/ofertas-empleo/seguridad"

      expect(response).to redirect_to("/offers/job_categories/seguridad")
    end
  end

  describe "When visit '/ofertas-ciudad/medellin'" do
    it "Should be redirecto /offers/cities/medellin" do
      get "/ofertas-ciudad/medellin"

      expect(response).to redirect_to("/offers/cities/medellin")
    end
  end

end
