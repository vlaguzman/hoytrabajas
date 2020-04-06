require "rails_helper"

RSpec.describe Offers::ShowPresenter do
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
      title: "i am the offer",
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

  let(:subject) { described_class.new(the_offer) }

  describe "#is_public?" do
    context "when offer is not confidential" do
      it "should be truthy" do
        expect(subject.is_public?).to be_truthy
      end
    end

    context "when offer is confidential" do
      let(:confidential_offer) { create(:offer, confidential: true) }

      let(:subject) { described_class.new(confidential_offer) }

      it "should be falsy" do
        expect(subject.is_public?).to be_falsy
      end
    end
  end

  describe "#affinity_percentage" do
    context "when the user have affinity with the offer" do

      let(:subject) { described_class.new(the_offer, current_user: candidate) }

      it "should return expected object" do
        epxected_object = {
          label: 'Afinidad',
          value: "28%"
        }

        expect(subject.affinity_percentage).to eq(epxected_object)
      end
    end
  end

  describe "#related_offers" do
    context "When the offer have other related offers" do

      it "Should return expected object" do
        expected_hash = {
          title: 'Ofertas similares a tu oferta',
          list: []
        }

        expect(subject.related_offers).to eq(expected_hash)
      end
    end
  end

  describe "#company_details" do
    context "when the company container is visible" do
      it "should return a hash with the company details" do

        company_logo_path = Rails.application.routes.url_helpers.rails_blob_path(the_offer.company.logo, disposition: "attachment", only_path: true)

        expected_object = {
          logo: company_logo_path,
          logo_alt: 'Nexarte Servicios Temporales S.A logo',
          name: 'Nexarte Servicios Temporales S.A',
          description: 'Industría telecomunicaciones',
          city: "Bogotá D.C., Cundinamarca",
          employees_range: '50 a 100 empleados',
          web_site: 'nexarte.com'
        }

        expect(subject.company_details).to eq(expected_object)

      end
    end
  end

  describe "#offer_details_list" do
    context "When the offer details are complete" do
      it "Should return expected array" do
        expected_array = [
          { label: 'Cargo', value: 'Ejecutivo comercial' },
          { label: 'Número de vacantes', value: 3 },
          { label: 'Tipo de oferta', value: 'Medio tiempo' },
          { label: 'Modalidad de trabajo', value: 'Teletrabajo' },
          { label: 'Acuerdo Legal', value: 'Termino Fijo' },
          { label: 'Salario', value: 'COP $2.500.000 / Mes' },
          { label: 'Días', value: 'Lunes a viernes' },
          { label: 'Jornada', value: 'Mañana 7 a 1pm - Tarde 2pm a 7pm' },
          { label: 'Auxilios o prestaciones', value: 'Auxilio de Transporte' }
        ]

        expect(subject.offer_details_list).to eq(expected_array)
      end
    end

    context "When the offer does not have this details" do
      let(:empty_offer) { create(:offer, :empty) }
      let(:subject) { described_class.new(empty_offer) }

      it "should return the expected object" do
        expected_array = [
          { label: 'Cargo', value: 'No registra' },
          { label: 'Número de vacantes', value: 'No registra' },
          { label: 'Tipo de oferta', value: 'No registra' },
          { label: 'Modalidad de trabajo', value: 'No registra' },
          { label: 'Acuerdo Legal', value: 'No registra' },
          { label: 'Salario', value: 'No registra' },
          { label: 'Días', value: 'No registra' },
          { label: 'Jornada', value: 'No registra' },
          { label: 'Auxilios o prestaciones', value: 'No registra' }
        ]

        expect(subject.offer_details_list).to eq(expected_array)
      end
    end
  end

  describe "#requirements_list" do
    context "When the requirements are complete" do
      it "Should return expected object" do
        expected_array = [
          {label: 'Residente en', value: 'Bogotá D.C.' },
          {label: 'Experiencia', value: 'No requiere' },
          {label: 'Manejo del idioma', value: 'Ingles Avanzado, Aleman Bajo' },
          {label: 'Responsabilidades', value: 'Gestión humana y recursos humanos' },
          {label: 'Requerimientos', value: 'Certificación IPA' }
        ]

        expect(subject.requirements_list).to eq(expected_array)
      end
    end

    context "when the offer does not have rquirements" do
      let(:empty_offer) { create(:offer, :empty) }
      let(:subject) { described_class.new(empty_offer) }

      it "should return the expected object" do
        expected_array = [
          {label: 'Residente en', value: 'No registra' },
          {label: 'Experiencia', value: 'No requiere' },
          {label: 'Manejo del idioma', value: 'No registra' },
          {label: 'Responsabilidades', value: 'No registra' },
          {label: 'Requerimientos', value: 'No registra' }
        ]

        expect(subject.requirements_list).to eq(expected_array)
      end
    end
  end

  describe "#title_capitalize" do
    it "Should return the title of the offer with capitalize" do

      expect(subject.title_capitalize).to eq("I am the offer")

    end
  end

  describe "#tags" do
    it "should return a hash that contain the group of tags" do

      expected_object = {
        location: ['Bogotá D.C.'],
        job_categories: ["Health", "Care"],
        immediate_start: ['Inicio inmediato']
      }

      expect(subject.tags).to eq(expected_object)

    end
  end

  describe "#description_capitalized" do
    it "should return the offer description with the first capitalized letter" do
      expect(subject.description_capitalized).to eq("I should be a very long description but i dont want")
    end

    context "when descriptions is nil" do

      let(:empty_offer) { create(:offer, :empty, description: nil) }
      let(:subject) { described_class.new(empty_offer) }

      it "should return a empty string" do
        expect(subject.description_capitalized).to eq("")
      end
    end
  end

  describe "#im_offer_owner?" do
  let(:subject) { described_class.new(the_offer, current_company: hoy_trabajas_company) }

    it "should return a boolean" do
      expect(subject.im_offer_owner?).to be_truthy
    end

    context "When other company visit the offer" do
      let(:other_company) { create(:company) }

      let(:subject) { described_class.new(the_offer, current_company: other_company) }

      it "should return falsy" do
        expect(subject.im_offer_owner?).to be_falsy
      end
    end
  end

  describe "#other_details" do
    it "should return array with prety close date and pretty applications" do
      expected_array = [
        {label: "Cierre de la oferta", value: "20 de Febrero del 2020"},
        {label: "Aplicaciones", value: "3 Candidato(s)"}
      ]

      expect(subject.other_details).to eq(expected_array)

    end
  end

  describe "#applied_offer_button_details" do
    let!(:candidate_applied) { create(:applied_offer, curriculum_vitae: candidate.curriculum_vitae, offer: the_offer) }

    let(:subject) { described_class.new(the_offer, current_user: candidate) }

    it "should return the data to apply to the offer" do
      expected_object = {
        cookies_present: nil,
        is_applied: true,
        offer_id: subject.id,
        total_applications: 4,
        path_applied_offers_rest: '/applied_offers_rest',
        translations: {
          applied_offer_modal: {
            button: "¡Perfecto!",
            dashboard: "Mi tablero > Mis aplicaciones",
            description: "Puedes seguir aplicando a todas las ofertas que tenemos para ti y consultar su estado en tu tablero",
            title: "¡Has aplicado a esta oferta!"
          },
          button_active: "Aplicar ahora",
          button_disactive: "¡Has aplicado!"
        }
      }

      expect(subject.applied_offer_button_details).to eq(expected_object)
    end
  end

  describe "#im_a_company?" do
    context "When a company is logged in" do
      let(:subject) { described_class.new(the_offer, current_company: hoy_trabajas_company) }

      it "should return a boolean" do
        expect(subject.im_a_company?).to be_truthy
      end
    end

    context "When current company is not present" do
      let(:subject) { described_class.new(the_offer, current_user: candidate) }

      it "Should return a falsy" do
        expect(subject.im_a_company?).to be_falsy
      end
    end
  end

  describe "#in_preview?" do
    context "When the offer is in preview status" do
      let(:offer_in_preview) do
        create(:offer, status: Offer::OFFER_STATUS[3])
      end

      let(:subject) { described_class.new(offer_in_preview, current_company: hoy_trabajas_company) }

      it "Should be truthy" do
        expect(subject.in_preview?).to be_truthy
      end
    end
  end

end
