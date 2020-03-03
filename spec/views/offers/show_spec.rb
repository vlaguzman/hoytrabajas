require 'rails_helper'

RSpec.describe "offers/show" do
  let(:cundinamarca) { create(:state, description: "Cundinamarca") }
  let(:bogota) { create(:city, description: 'Bogotá D.C.', state: cundinamarca) }

  let(:hoy_trabajas_company) { create(:company, :with_logo,
    name: 'Nexarte Servicios Temporales S.A',
    description: 'Industría telecomunicaciones',
    employees_range: create(:employees_range, description: '50 a 100'),
    web_site: 'nexarte.com',
    city: bogota
  ) }

  let!(:contract) { create(:contract_type, description: 'Termino Fijo' ) }
  let!(:car) { create(:vehicle) }

  let(:the_offer) do
    create(:offer,
      title: "i am the offer title",
      description: "i should be a very long description but i dont want",
      immediate_start: true,
      city: bogota,
      close_date: Date.new(2020, 02, 20),
      company: hoy_trabajas_company,
      vacancies_quantity: 3,
      job_categories: [ create(:job_category, description: "Health"), create(:job_category, description: "Care") ],
      sexes: [create(:sex, description: 'Mujer')],
      responsibilities: [create(:responsibility, description: 'Gestión humana y recursos humanos')],
      requirements: [create(:requirement, description: 'Certificación IPA')],
      work_positions: [create(:work_position, description: "Ejecutivo comercial")],
      offer_type: create(:offer_type, description: 'Medio tiempo' ),
      work_mode: create(:work_mode, description: 'Teletrabajo'),
      contract_type: contract,
      working_days: [
        create(:working_day, description: "Mañana 7 a 1pm"),
        create(:working_day, description: "Tarde 2pm a 7pm")
      ],
      available_work_days: [create(:available_work_day, description: 'Lunes a viernes' ) ],
      job_aids: [create(:job_aid, description: 'Auxilio de Transporte')],
      vehicles: [car]
    )
  end

  let!(:salary) { create(:offer_salary,
    offer: the_offer,
    from: 2500000,
    to: nil,
    currency: create(:currency, description: 'COP'),
    salary_period: create(:salary_period, description: 'Mes')
  ) }

  let!(:offer_age_range) { create(:age_range, offer: the_offer, from: 18, to: 35) }

  let!(:languages_offers) do
    [
      create(:languages_offers, offer: the_offer, language: create(:language, description: 'Ingles'), level: create(:level, description: 'Avanzado') ),
      create(:languages_offers, offer: the_offer, language: create(:language, description: 'Aleman'), level: create(:level, description: 'Bajo') )
    ]
  end

  let(:candidate) { create(:user,
    contract_type: contract,
    city: bogota,
    vehicles: [car]
  ) }

  let!(:applied_offers) { create_list(:applied_offer, 3, offer: the_offer) }

  describe "layout" do
    it "should contain the header and footer component" do
      assign(:offer, Offers::ShowPresenter.new(the_offer, current_user: candidate))

      render

      expect(rendered).to have_tag('div', :with => { "data-react-class" => 'src/components/Layout/Header' })
      expect(rendered).to have_tag('div', :with => { "data-react-class" => 'src/components/Layout/Footer' })

      #title
      expect(rendered).to have_tag(:h1, text: "I am the offer title")

      #tags
      expect(rendered).to have_tag(:span, text: "Bogotá D.C.")
      expect(rendered).to have_tag(:span, text: "Health")
      expect(rendered).to have_tag(:span, text: "Care")

      #affinity
      expect(rendered).to match(/28%/)

      #Description
      expect(rendered).to have_tag('div.a-offerDescription', text: /I should be a very long description but i dont want/)

      #details
      expect(rendered).to have_tag('div.a-labelBox', text: "Oferta dirigida a")
      expect(rendered).to have_tag('div.a-spanBox', text: 'Mujer')

      #company
      expect(rendered).to have_tag('img', src: Rails.application.routes.url_helpers.rails_blob_path(hoy_trabajas_company.logo, disposition: "attachment", only_path: true) )
      expect(rendered).to have_tag('div.a-companyName', text: 'Nexarte Servicios Temporales S.A')
      expect(rendered).to have_tag('div.__location', text: 'Bogotá D.C., Cundinamarca')
      expect(rendered).to have_tag('div.__employeesRange', text: '50 a 100 empleados')
    end
  end
end
