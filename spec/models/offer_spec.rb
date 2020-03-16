require 'rails_helper'

RSpec.describe Offer, type: :model, vcr: true do
  describe "#languages_list" do
    let(:subject) { create(:offer, id: 11) }

    it "should return languages list" do
      expected_array = create_list(:languages_offers, 5, offer_id: subject.id)

      expect(subject.languages_list).to eq(expected_array)
    end
  end

  describe "class methods" do
    let(:subject) { described_class }

    describe "scopes" do
      it { should respond_to(:related_job_category) }
      it { should respond_to(:by_applied_offer_cv) }
      it { should respond_to(:active) }
      it { should respond_to(:by_job_categories) }
    end

    let!(:cv)                { create(:curriculum_vitae) }
    let!(:cv_2)              { create(:curriculum_vitae) }
    let!(:cv_3)              { create(:curriculum_vitae) }
    let!(:job_category)      { create(:job_category, description: 'Operario') }
    let!(:job_category_2)    { create(:job_category, description: 'Marketing') }
    let!(:job_category_3)    { create(:job_category, description: 'Seguridad') }
    let!(:offer)             { create(:offer, id: 12, title: 'just_an_offer', job_categories: [job_category]) }
    let!(:offer_2)           { create(:offer, id: 13, title: 'an_other_offer', job_categories: [job_category_2]) }
    let!(:applied_offer)     { create(:applied_offer, curriculum_vitae: cv, offer: offer) }
    let!(:applied_offer_2)   { create(:applied_offer, curriculum_vitae: cv, offer: offer_2) }
    let!(:applied_offer_3)   { create(:applied_offer, curriculum_vitae: cv_2, offer: offer_2) }

    let(:expected_offer_attr_array) { [:city_id, :work_mode_id, :contract_type_id] }
    let(:expected_offer_list_array) { [:job_categories, :working_days, :available_work_days, :languages_list, :technical_skills, :vehicles, :driving_licences, :soft_skills, :sexes, :educational_level] }

    describe "#attributes_to_compare " do
      it "Should return the array with principal attributes" do
        expect(subject::ATTRIBUTES_TO_COMPARE).to match_array(expected_offer_attr_array)
      end
    end

    describe "#lists_to_compare" do
      it "Should return the array with principal list attributes" do
        expect(subject::LISTS_TO_COMPARE).to match_array(expected_offer_list_array)
      end
    end

    describe "#by_job_categories" do
      let!(:offer_3) { create(:offer, id: 14, title: 'an_other_offer_three', job_categories: [job_category, job_category_2]) }
      let!(:offer_4) { create(:offer, id: 15, title: 'an_other_offer_four', job_categories: [job_category]) }

      context "When you search for a category and find results" do
        it "Should return the results found" do
          expect(Offer.by_job_categories(job_category.id).first.job_category_ids).to include(job_category.id)
          expect(Offer.by_job_categories(job_category.id).count).to eq(3)
        end
      end

      context "When you search through several categories and find results" do
        it "Should return the results found" do
          ids_categories = [job_category.id, job_category_2.id]
          expect(Offer.by_job_categories(ids_categories).map(&:job_category_ids).flatten.uniq).to match_array([job_category.id, job_category_2.id])
          expect(Offer.by_job_categories([job_category.id, job_category_2.id]).count).to eq(4)
        end
      end

      context "When no results are found by the category sought" do
        it "Should not return anything" do
          expect(Offer.by_job_categories(job_category_3.id).count).to eq(0)
        end
      end
    end

    describe "#by_applied_offer_cv" do
      context "there just one opply offer with a cv_id" do
        it "should return the offers related to a curriculum vitae" do
          expect(Offer.by_applied_offer_cv(cv_2.id).first.title).to eq('an_other_offer')
          expect(Offer.by_applied_offer_cv(cv_2.id).count).to eq(1)
        end
      end

      context "there are two opplied offers" do
        it "should return the offers related to a curriculum vitae" do
          expect(Offer.by_applied_offer_cv(cv.id).first.title).to eq('just_an_offer')
          expect(Offer.by_applied_offer_cv(cv.id).count).to eq(2)
        end
      end

      context "there not are any applied offers by cv_id" do
        it "shold return an empty array" do
          expect(Offer.by_applied_offer_cv(cv_3.id)).to eq([])
          expect(Offer.by_applied_offer_cv(cv_3.id).count).to eq(0)
        end
      end
    end

    describe "#not_applied_offers_by_cv" do
      context "there just one opply offer with a cv_id" do
        it "should return the offers that is not related to a curriculum vitae" do
          expect(Offer.not_applied_offers_by_cv(cv_2.id).count).to eq(1)
          expect(Offer.not_applied_offers_by_cv(cv_2.id).first.title).to eq('just_an_offer')
        end
      end

      context "there are two opplied offers" do
        it "should return an empty array" do
          expect(Offer.not_applied_offers_by_cv(cv.id).count).to eq(0)
          expect(Offer.not_applied_offers_by_cv(cv.id)).to eq([])
        end
      end

      context "there not are any applied offers by cv_id" do
        it "shold return an array with all offers" do
          expect(Offer.not_applied_offers_by_cv(cv_3.id).count).to eq(2)
        end
      end
    end
  end

  describe "validations" do
    it { should validate_presence_of(:title) }

    it { should respond_to(:address) }
    it { should respond_to(:cellphone) }
    it { should respond_to(:description) }
    it { should respond_to(:vacancies_quantity) }
    it { should respond_to(:close_date) }
    it { should respond_to(:immediate_start) }
    it { should respond_to(:required_experience) }
    it { should respond_to(:description_responsibilities) }
    it { should respond_to(:release_date) }
    it { should respond_to(:status) }
    it { should respond_to(:image) }
    it { should respond_to(:company_description) }
    it { should respond_to(:company_name) }
    it { should respond_to(:company_web_site) }
    it { should respond_to(:company_employees_range_description) }

    it { should respond_to(:salary_from) }
    it { should respond_to(:salary_to) }
    it { should respond_to(:salary_currency_description) }
    it { should respond_to(:salary_period_description) }

    it { should respond_to(:age_range_from) }
    it { should respond_to(:age_range_to) }

    it { should respond_to(:city_description) }
    it { should respond_to(:offer_type_description) }
    it { should respond_to(:work_mode_description) }
    it { should respond_to(:contract_type_description) }
    it { should respond_to(:available_work_days_description) }
    it { should respond_to(:working_days_description) }

    it { should respond_to(:languages_list) }
  end

  context "attachments" do
    subject {  FactoryBot.build(:offer).image }

    it { should be_an_instance_of(ActiveStorage::Attached::One) }
  end

  describe "assocciations" do
    it { should belong_to(:company) }
    it { should belong_to(:city) }
    it { should belong_to(:offer_type) }
    it { should belong_to(:work_mode) }
    it { should belong_to(:contract_type) }
    it { should have_one(:offer_salary) }
    it { should have_one(:offer_required_experiences) }
    it { should have_and_belong_to_many(:job_categories) }
    it { should have_and_belong_to_many(:terms) }
    it { should have_and_belong_to_many(:functions) }
    it { should have_and_belong_to_many(:job_aids) }
    it { should have_and_belong_to_many(:vehicles) }
    it { should have_and_belong_to_many(:driving_licences) }
    it { should have_and_belong_to_many(:working_days) }
    it { should have_and_belong_to_many(:available_work_days) }
    it { should have_and_belong_to_many(:languages) }
    it { should have_and_belong_to_many(:soft_skills) }
    it { should have_and_belong_to_many(:technical_skills) }
    it { should have_and_belong_to_many(:work_positions) }
    it { should have_and_belong_to_many(:responsibilities) }
    it { should have_and_belong_to_many(:educational_level) }
    it { should have_and_belong_to_many(:sexes) }
  end

  describe "#active" do
    context "there are just one active_offer" do
      let!(:offer) { create(:offer, id: 16) }
      it "should return one offer" do
        expect(Offer.active.count).to eq(1)
      end
    end

    context "there are not active_offer" do
      let!(:offer) { create(:offer, :expired_offer, id: 17) }
      it "should not return any offer" do
        expect(Offer.active.count).to eq(0)
      end
    end

    context "there are active and expired offers" do
      let!(:offers) do
        [
          create(:offer, id: 18, title: 'active_offer'),
          create(:offer, :expired_offer, id: 51)
        ]
      end
      it "should return just the active_offer" do
        expect(Offer.active.first.title).to eq('active_offer')
        expect(Offer.active.count).to eq(1)
      end
    end

  end

  describe "#before_save" do
    it "assign the parametrized name to the slug field" do
      offer = build(:offer, id: 19, title: 'Pañalera de pingüinos de compañía', slug: nil)
      offer.save
      expect(offer.slug).to eq('panalera-de-pinguinos-de-compania')
    end
  end

  describe "#order_by_demand_and_created_at" do
    context "There are one offer_on_demand with status up and one with status down" do
      it "should return offers showing first the on demand offers, ordered by the start_at of the offer_on_demand descendingly and ordered by created_at descendingly of created_at of offer" do
        offer_1 = create(:offer, id: 20, title: 'first created', created_at: (Time.now - 4.days))

        offer_2 = create(:offer, id: 21, title: 'second created', created_at: (Time.now - 3.days))
        create(:offer_on_demand, offer_id: offer_2.id, status: "down", start_at: Time.new(2019, 02, 04))

        offer_3 = create(:offer, id: 22, title: 'third created', created_at: (Time.now - 2.days))
        create(:offer_on_demand, offer_id: offer_3.id, status: "up", start_at: Time.new(2019, 02, 03))

        offer_4 = create(:offer, id: 23, title: 'quarter created', created_at: (Time.now - 1.days))

        response = described_class.order_by_demand_and_created_at

        expect(response[0]).to eq(offer_3)
        expect(response[1]).to eq(offer_4)
        expect(response[2]).to eq(offer_2)
        expect(response[3]).to eq(offer_1)
      end
    end

    context "There are two offer_on_demand with status up" do
      it "should return offers showing first the on demand offers, ordered by the start_at of the offer_on_demand descendingly and ordered by created_at descendingly of created_at of offer" do
        offer_1 = create(:offer, id: 24, title: 'first created', created_at: Time.new(2019, 01, 01))

        offer_2 = create(:offer, id: 25, title: 'second created', created_at: Time.new(2019, 01, 03))
        create(:offer_on_demand, offer_id: offer_2.id, status: "up", start_at: Time.new(2019, 01, 04))

        offer_3 = create(:offer, id: 26, title: 'third created', created_at: Time.new(2019, 01, 03))
        create(:offer_on_demand, offer_id: offer_3.id, status: "up", start_at: Time.new(2019, 01, 03))

        offer_4 = create(:offer, id: 27, title: 'quarter created', created_at: Time.new(2019, 01, 04))

        response = described_class.order_by_demand_and_created_at

        expect(response[0]).to eq(offer_2)
        expect(response[1]).to eq(offer_3)
        expect(response[2]).to eq(offer_4)
        expect(response[3]).to eq(offer_1)
      end
    end
  end

  describe "quering with elasticsearch" do

    before do
      client = described_class.__elasticsearch__.client = Elasticsearch::Client.new host: "#{ENV['TEST_ELASTICSEARCH_HOST']}:9200"
      described_class.__elasticsearch__.delete_index! if client.indices.exists? index: :offers
      described_class.__elasticsearch__.create_index!
    end

    after do
      client = described_class.__elasticsearch__.client = Elasticsearch::Client.new host: "#{ENV['ELASTICSEARCH_HOST']}:9200"
      described_class.__elasticsearch__.delete_index! if client.indices.exists? index: :offers
      described_class.__elasticsearch__.create_index!
    end

    describe "#__elasticsearch__", vcr: true do
      it "Should be present the docfile" do
        es_version = subject.__elasticsearch__.client.info['version']['number']
        dotfile = "#{File.open(".elasticsearch-version", &:readline).chomp}"
        expect(dotfile).to eql(es_version)
      end
    end

    describe "#search", vcr: true do
      let(:subject) { described_class }

      context "When no records in db" do

        it "Should return zero records" do
          subject.import

          response = subject.search("*:*")

          expect(response.size).to be_zero
        end
      end

      context "When records are present" do
        let!(:stuffed_offers) do
          create(:offer, id: 51)
          create(:offer, id: 52)
          create(:offer, id: 53)
          create(:offer, id: 54)
          create(:offer, id: 55)
          create(:offer, id: 56)
          create(:offer, id: 57)
          create(:offer, id: 58)
          create(:offer, id: 59)
          create(:offer, id: 60)
          create(:offer, id: 61)
        end

        it "Should return the mapped offers" do
          subject.import

          response = subject.search({query: { match_all: {} }})

          expect(response.size).to eq(10)
        end
      end

      describe "mappings" do
        context "When mappings is defined" do
          let(:subject) { described_class }

          let!(:demo_offer) do
            create(:offer, {
              id: 50,
              title: "demo title",
              description: "demo description",
              city: create(:city, id: 303, description: "Bogotá"),
              job_categories: [create(:job_category, id: 72, description: "tech")],
              contract_type: create(:contract_type, id: 107, description: 'Programable'),
              work_mode: create(:work_mode, id: 107, description: 'codificar'),
              created_at: DateTime.new(2020, 3, 10, 10, 0, 0)
            })
          end

          it "Should return expected object" do
            subject.import

            response = subject.search({query: { match_all: {} }})

            expected_object = {
              "_index"=> "offers",
              "_type"=> "_doc",
              "_id"=> demo_offer.id.to_s,
              "_score"=> 1.0,
              "_source"=> {
                "id"=> demo_offer.id,
                "title"=> demo_offer.title,
                "description"=> demo_offer.description,
                "status"=> demo_offer.status,
                "created_at"=> "2020-03-10T05:00:00.000-05:00",
                "city"=> {"id" => demo_offer.city.id, "description" => demo_offer.city.description},
                "job_categories"=> demo_offer.job_categories.map { |category| {"id"=> category.id, "description"=> category.description} },
                "work_mode"=> {"id" => demo_offer.work_mode.id, "description" => demo_offer.work_mode.description},
                "contract_type"=> {"id" => demo_offer.contract_type.id, "description" => demo_offer.contract_type.description},
                "job_aids"=> demo_offer.job_aids.map { |aid| {"id"=> aid.id, "description"=> aid.description} },
                "languages"=> demo_offer.job_aids.map { |language| {"id"=> language.id, "description"=> language.description} },
                "working_days"=> demo_offer.job_aids.map { |working_day| {"id"=> working_day.id, "description"=> working_day.description} },
                "available_work_days"=> demo_offer.available_work_days.map { |day| {"id"=> day.id, "description"=> day.description} }
              }
            }

            expect(Offer.count).to eq(1)

            expect(response.results.count).to eq(1)
            expect(response.results[0].to_h).to eq(expected_object)

          end
        end
      end
    end

    describe "#search_by", vcr: true do
      let(:bogota) { create(:city) }
      let(:medellin) { create(:city) }

      #Job Categories
      let(:tech_category) { create(:job_category) }
      let(:cook_category) { create(:job_category) }

      #Work Modes
      let(:remote_mode) { create(:work_mode) }
      let(:fixed_mode) { create(:work_mode) }

      #Contract Types
      let(:service_provision) { create(:contract_type) }
      let(:indefinite_contract) { create(:contract_type) }

      #Available work days
      let(:monday) { create(:available_work_day) }
      let(:friday) { create(:available_work_day) }

      #Working days
      let(:morning) { create(:working_day) }
      let(:late) { create(:working_day) }

      #JobAids
      let(:transport) { create(:job_aid) }

      #Languages
      let(:spanish) { create(:language) }
      let(:english) { create(:language) }
      let(:german) { create(:language) }

      let(:subject) { described_class }

      let!(:stuffed_offers) do
        create(:offer, id: 9001)
        create(:offer, id: 9002)
        create(:offer, id: 9003)
        create(:offer, id: 9004)
        create(:offer, id: 9005)
      end

      context "when does not recibe parameters" do
        it "should return all posible results" do
          subject.import

          response = subject.search_by

          expect(response.count).to eq(5)
        end
      end

      context "when recibe city id" do

        let!(:bogota_offers) do
          create(:offer, id: 9006, city: bogota)
          create(:offer, id: 9007, city: bogota)
          create(:offer, id: 9008, city: bogota)
          create(:offer, id: 9009, city: bogota)
        end

        let!(:medellin_offers) do
          create(:offer, id: 9010, city: medellin)
          create(:offer, id: 9011, city: medellin)
          create(:offer, id: 9012, city: medellin)
          create(:offer, id: 9013, city: medellin)
          create(:offer, id: 9014, city: medellin)
          create(:offer, id: 9015, city: medellin)
        end

        it "should return 5 results to bogota anf six to medellin" do
          subject.import

          response = subject.search_by(city: bogota.id)

          expect(response.count).to eq(4)

          response = subject.search_by(city: medellin.id)

          expect(response.count).to eq(6)

          response = subject.search_by(city: [bogota.id, medellin.id])

          expect(response.count).to eq(10)

          response = subject.search_by

          expect(response.count).to eq(15)
        end
      end

      context "when recibe all posible search parameters" do
        let!(:offer_objetive) { create(:offer,
          id: 9016,
          title: "the developer",
          city: bogota,
          job_aids: [transport],
          work_mode: remote_mode,
          working_days: [morning],
          contract_type: indefinite_contract,
          job_categories: [tech_category],
          available_work_days: [monday],
          status: 'active'
        ) }

        let!(:offer_trap) { create(:offer,
          id: 9017,
          title: "programmer",
          city: bogota,
          job_aids: [transport],
          work_mode: remote_mode,
          working_days: [morning],
          contract_type: indefinite_contract,
          job_categories: [tech_category],
          available_work_days: [monday],
          status: 'active'
        ) }

        let!(:the_offer_english) { create(:languages_offers, offer: offer_objetive, language: english) }
        let!(:the_offer_trap_english) { create(:languages_offers, offer: offer_trap, language: english) }

        it "should return only one response" do

          subject.import

          search_parameters = {
            status: 'active',
            keywords: 'developer',
            city: bogota.id,
            job_categories: tech_category.id,
            work_mode: remote_mode.id,
            contract_type: indefinite_contract.id,
            available_work_days: monday.id,
            working_days: morning.id,
            job_aids: transport.id,
            languages: english.id
          }

          response = subject.search_by

          expect(response.count).to eq(7)

          response = subject.search_by( **search_parameters )

          expect(response.count).to eq(1)
          expect(response.last[:title]).to eq('the developer')
        end
      end

    end
  end
end