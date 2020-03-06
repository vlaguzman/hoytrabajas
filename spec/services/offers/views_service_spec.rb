require "rails_helper"
include ActionView::Helpers::NumberHelper

RSpec.describe Offers::ViewsService do

  let(:job_category) do
    create(:job_category,
      description: "any-category",
      image: "https://img-categorias-ht.s3.amazonaws.com/any.png"
    )
  end

  let(:job_category_no_image) { create(:job_category, description: "any-category-no-image") }

  let(:offer) do
    create(:offer, title: "District Facilitator",
      description: "endSint esse anim consequat commodo.",
      created_at: Date.new(2019, 7, 1),
      close_date: Date.new(2019, 7, 3),
      immediate_start: true,
      job_categories: [job_category],
      required_experience: true,
      city: create(:city, description: "Bogotá"),
      company: create(
        :with_logo_company,
        name: "Orellana S.A."
      )
    )
  end

  let(:offer_no_image) do
    create(:offer, title: "District Facilitator",
      description: "endSint esse anim consequat commodo.",
      created_at: Date.new(2019, 7, 1),
      close_date: Date.new(2019, 7, 3),
      immediate_start: true,
      job_categories: [job_category_no_image],
      required_experience: true,
      city: create(:city, description: "Bogotá"),
      company: create(:company, name: "Orellana S.A.")
    )
  end

  let(:offer_no_job_category) do
    create(:offer, title: "District Facilitator",
      description: "endSint esse anim consequat commodo.",
      created_at: Date.new(2019, 7, 1),
      close_date: Date.new(2019, 7, 3),
      immediate_start: true,
      required_experience: true,
      city: create(:city, description: "Bogotá"),
      company: create(:with_logo_company,
                 name: "Orellana S.A.")
    )
  end

  let(:offer_no_close_date) do
    create(:offer, title: "District Facilitator",
      description: "endSint esse anim consequat commodo.",
      created_at: Date.new(2019, 7, 1),
      close_date:nil,
      immediate_start: true,
      job_categories: [job_category],
      required_experience: true,
      city: create(:city, description: "Bogotá"),
      company: create(:with_logo_company,
                  name: "Orellana S.A.")
    )
  end

  let(:subject) { described_class.new(offer) }
  let(:subject_no_image) { described_class.new(offer_no_image) }
  let(:subject_no_job_category) { described_class.new(offer_no_job_category) }
  let(:subject_no_close_date) { described_class.new(offer_no_close_date) }

  let(:offers_salary) { create(:offer_salary,
    offer: offer,
    from: 1000000,
    to: 5000000,
    salary_period: create(:salary_period, description: "Monthly")
  ) }

  let(:expected_object) do {
    id_offer: offer.id,
    title: "District Facilitator",
    description: "endSint esse anim consequat commodo.",
    immediate_start: true,
    job_category_image: "https://img-categorias-ht.s3.amazonaws.com/any.png",
    required_experience: true,
    on_demand: nil,
    affinity_percentage: false,
    applied_offers: 0,
    raw_close_date: Time.zone.local(2019, 7, 3).to_s,
    confidential: false,
    city: {
      description: "Bogotá"
    },
    salary: {
      from: "$1,000,000",
      to: "$5,000,000",
      currency: {
        description: "COP"
      },
      salary_period: {
        description: "Monthly"
      }
    },
    company: {
      name: "Orellana S.A.",
      url_image_logo: Rails.application.routes.url_helpers.rails_blob_path(offer.company.logo, disposition: "attachment", only_path: true)
    },
    close_date: "03 de Julio del 2019",
  } end

  let(:expected_object_default_url) do {
    id_offer: offer_no_image.id,
    title: "District Facilitator",
    description: "endSint esse anim consequat commodo.",
    immediate_start: true,
    job_category_image: "https://img-categorias-ht.s3.amazonaws.com/cat-card-gestion-administrativa2x.png",
    required_experience: true,
    affinity_percentage: false,
    applied_offers: 0,
    raw_close_date: Time.zone.local(2019, 7, 3).to_s,
    on_demand: nil,
    confidential: false,
    city: {
      description: "Bogotá"
    },
    salary: {
      from: nil,
      to: nil,
      currency: {
        description: nil
      },
      salary_period: {
        description: nil
      }
    },
    company: {
      name: "Orellana S.A.",
      url_image_logo: "https://ht-web-images.s3.amazonaws.com/perfiles/avatar-empresa.png"
    },
    close_date: "03 de Julio del 2019",
  } end

  let(:expected_object_default_url_2) do {
    id_offer: offer_no_job_category.id,
    title: "District Facilitator",
    description: "endSint esse anim consequat commodo.",
    immediate_start: true,
    job_category_image: "https://img-categorias-ht.s3.amazonaws.com/cat-card-gestion-administrativa2x.png",
    required_experience: true,
    on_demand: nil,
    affinity_percentage: false,
    applied_offers: 0,
    raw_close_date: Time.zone.local(2019, 7, 3).to_s,
    confidential: false,
    city: {
      description: "Bogotá"
    },
    salary: {
      from: nil,
      to: nil,
      currency: {
        description: nil
      },
      salary_period: {
        description: nil
      }
    },
    company: {
      name: "Orellana S.A.",
      url_image_logo: Rails.application.routes.url_helpers.rails_blob_path(offer_no_job_category.company.logo, disposition: "attachment", only_path: true)
    },
    close_date: "03 de Julio del 2019",
  } end

  describe "#details" do
    it { should respond_to(:details) }

    it "should return a hash with the required info to show template" do
      offers_salary
      expect(subject.details).to eq(expected_object)
    end

    context "the offer has not any category" do
      it "should return a hash with the DEFAULT_IMAGE_URL" do
        expect(subject_no_job_category.details).to eq(expected_object_default_url_2)
      end
    end

    context "neither the job category of the offer has image nor the company logo" do
      it "should return a hash with the DEFAULT_IMAGE_URL and the DEFAULT_LOGO_IMAGE_URL" do
        expect(subject_no_image.details).to eq(expected_object_default_url)
      end
    end

    context "the offer has not any close date" do
      it "Should return a close date tomorrow" do
        expect(subject_no_close_date.details[:close_date]).to eq(DatesManager.default(date: Date.today + 1.day ))
      end
    end

  end

  describe "#affinity_percentage_builder" do
    context "When the candidate does not reach the 20%" do
      it "Should return nothing" do
        response = subject.affinity_percentage_builder

        expect(response).to be_falsy
      end

    end

    context "When the user rebase the 20%" do
      context "when current_user is present and AffinityPercentage exist" do

        let(:curriculum_vitae)     { create(:curriculum_vitae) }
        let!(:affinity_percentage) { create(:affinity_percentage, offer_id: offer.id, curriculum_vitae_id: curriculum_vitae.id, version: '1.0', affinity_percentage: 55.0) }

        let(:subject) { described_class.new(offer, curriculum_vitae.user) }

        it "Should return the affinity_percentage of affinity_percentage related in text" do
          expect(AffinityPercentage.all.count).to eq(1)

          response = subject.affinity_percentage_builder

          expect(response).to eq("55%")
        end
      end

      context "when current_user is present and AffinityPercentage does not exist" do
        let(:contract_type) { create(:contract_type, description: "Indefinido")}
        let(:offer_contract)  { create(:empty_offer,
          contract_type: contract_type,
          title: "A Super Offer",
          description: 'a super description')}

        let(:curriculum_vitae) { create(:curriculum_vitae,
          job_categories: offer_contract.job_categories
        ) }

        let!(:candidate) { create(:user,
          :first_time_candidate,
          name: "conan",
          contract_type: contract_type,
          curriculum_vitaes: [curriculum_vitae]
        )}

        let(:subject) { described_class.new(offer_contract, candidate) }

        it "Should return the percetage in text" do
          expect(AffinityPercentage.all.count).to eq(0)

          response = subject.affinity_percentage_builder

          expect(response).to eq("100%")
        end
      end
    end

  end

end
