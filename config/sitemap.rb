SitemapGenerator::Sitemap.compress = false
SitemapGenerator::Sitemap.default_host = 'http://www.hoytrabajas.com'
SitemapGenerator::Sitemap.create do

  add '/users/sign_up'
  add '/users/sign_in'

  add '/companies/sign_in'
  add '/companies/sign_up'

  add '/offers'
  add '/offers/job_categories/servicios-generales-y-limpieza'
  add '/offers/job_categories/ventas-y-comercial'
  add '/offers/job_categories/gestion-administrativa'
  add '/offers/job_categories/operario'
  add '/offers/job_categories/logistica-y-transporte'
  add '/offers/job_categories/belleza,-bienestar-y-salud'
  add '/offers/job_categories/cocina,-bar-y-meseros'
  add '/offers/job_categories/tecnologia-y-programacion'
  add '/offers/job_categories/marketing,-diseno-y-publicidad'
  add '/offers/job_categories/eventos-y-protocolo'

  add '/ofertas-empleo'
  add '/ofertas-empleo/servicios-generales-limpieza'
  add '/ofertas-empleo/ventas-comercial'
  add '/ofertas-empleo/gestion-administrativa'
  add '/ofertas-empleo/operario'
  add '/ofertas-empleo/logistica-transporte'
  add '/ofertas-empleo/belleza-bienestar-salud'
  add '/ofertas-empleo/cocina-bar-meseros'
  add '/ofertas-empleo/tecnologia-programacion'
  add '/ofertas-empleo/markeing-diseno-publicidad'
  add '/ofertas-empleo/eventos-protocolo'
  add '/ofertas-empleo/seguridad'

  add '/ofertas-de-empleo'
  add '/buscador-de-empleo'

  Offer.all.map { |offer| offer.city_description}.uniq.map do |city_name|
    add "/ofertas-ciudad/#{city_name}"
  end

  add '/faqs'

end