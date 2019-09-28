require "rails_helper"

RSpec.describe Offers::ShowPresenter do
  let!(:level) { create(:level, description: "Avanzado") }
  let!(:language) { create(:language, description: "Ingles") }
  let(:monday_to_friday) { create(:available_work_day, description: "Lunes a Viernes") }
  let(:saturday) { create(:available_work_day, description: "Sabado") }
  let(:morning) { create(:working_day, description: "Mañana 7 a 1pm") }
  let(:late) { create(:working_day, description: "Tarde 2pm a 7pm") }
  let(:job_aid) { create(:job_aid, description: "Auxilio de Transporte") }

  let(:company) { create(:company,
    address: "Calle Falsa 123 # 00 99",
    description: "Sector de comunicaciones",
    employees_range: create(:employees_range, description: "20 a 80"),
    name: "Verdelógico S.A.S",
    web_site: "www.verdelógico.com"
  ) }

  let(:offer) { create(:offer,
    company: company,
    sex: create(:sex, description: "Mujer"),
    offer_type: create(:offer_type, description: "Medio Tiempo"),
    city: create(:city, description: "Bogotá D.C."),
    work_mode: create(:work_mode, description: "Teletrabajo"),
    contract_type: create(:contract_type, description: "Termino fijo"),
    title: "Desarrollador Front-end Sr. test",
    address: "Calle Falsa 123 # 00 99",
    close_date: Date.new(2019, 7, 25),
    description: "endSint esse anim consequat commodo. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliquaincididunt ut labore et dolore magna aliqua.",
  )}

  let!(:job_aids_offers) { create(:job_aids_offers, offer: offer, job_aid: job_aid) }

  let!(:offers_working_days) do
    [
      create(:offers_working_days, offer: offer, working_day: morning),
      create(:offers_working_days, offer: offer, working_day: late)
    ]
  end

  let!(:offers_salary) { create(:offers_salaries,
    offer: offer,
    from: 2500000,
    to: nil,
    salary_period: create(:salary_period, description: "Mensual")
  ) }
  let!(:languages_offers) { create(:languages_offers, offer: offer, language: language, level: level)}
  let!(:available_work_days_offers) do
  [
    create(:available_work_days_offers, offer: offer, available_work_day: monday_to_friday),
    create(:available_work_days_offers, offer: offer, available_work_day: saturday)
  ]
  end

  let!(:age_range) { create(:age_range, offer: offer) }
  let(:subject) { described_class.new(offer) }

  describe "#details" do
    it { should respond_to(:details) }

    it "should return a hash with the required info to show template" do
      expected_object = {
        close_date: "25 de Agosto del 2019",
        title: "Desarrollador Front-end Sr. test",
        address: "Calle Falsa 123 # 00 99",
        immediate_start: true,
        description: "endSint esse anim consequat commodo. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliquaincididunt ut labore et dolore magna aliqua.",
        vacancies_quantity: 10,
        required_experience: true,
        sex: {
          description: "Mujer"
        },
        age_range: {
          from: 18,
          to: 35
        },
        city:{
          description: "Bogotá D.C."
        },
        languages:[["Ingles Avanzado"]],
        offer_type: {
          description: "Medio Tiempo"
        },
        work_mode: {
          description: "Teletrabajo"
        },
        contract_type:{
          description: "Termino fijo"
        },
        salary:{
          currency: {
            description: "COP"
          },
          from: "$2,500,000",
          to: nil,
          salary_period: {
            description: "Mensual"
          }
        },
        available_work_days:["Lunes a Viernes", "Sabado"],
        working_days: [ "Mañana 7 a 1pm", "Tarde 2pm a 7pm" ],
        job_aids: ["Auxilio de Transporte"],
        company:{
          name: "Verdelógico S.A.S",
          description: "Sector de comunicaciones",
          employess_range: {
            description: "20 a 80"
          },
          web_site: "www.verdelógico.com"
        }
      }

      expect(subject.details).to eq(expected_object)
    end
  end

end