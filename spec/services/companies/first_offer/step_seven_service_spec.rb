require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepSevenService do
  let!(:company)  { create(:company) }
  let!(:offer)    { create(:offer, company_id: company.id) }

  let!(:city)               { create(:city, description: "Buenos Aires")}
  let!(:educational_degree) { create(:educational_degree)}
  let!(:technical_skiil)    { create(:technical_skill)}
  let!(:duration_type)      { create(:duration_type)}
  let!(:language)           { create(:language)}
  let!(:level)              { create(:level)}

  let!(:technical_skills_ids) do
    [
      create(:technical_skill, description: "SEO").id,
      create(:technical_skill, description: "Redes sociales").id,
      create(:technical_skill, description: "Ruby On Rails").id,
      create(:technical_skill, description: "Cocina Italiana").id,
      create(:technical_skill, description: "Pintar").id
    ]
  end

  let!(:languages_ids) do
    [
      create(:language, description: "Parsel").id,
      create(:language, description: "Inglés").id,
    ]
  end

  let!(:levels_ids) do
    [
      create(:level, description: "bajo").id,
      create(:level, description: "medio").id,
      create(:level, description: "avanzado").id
    ]
  end

  it { should be_an_instance_of(Module) }

  describe "#call" do
    context "when all data is correct" do
      let(:params) do
        {
          id: offer.id,
          city_id: city.id,
          educational_degree_id: educational_degree.id,
          required_experience: true,
          duration: '2',
          duration_type_id: duration_type.id,
          technical_skills: [
            {
              technical_skill_id: technical_skills_ids[0],
              level_id: levels_ids[0]
            },
            {
              technical_skill_id: technical_skills_ids[1],
              level_id: levels_ids[2]
            },
            {
              technical_skill_id: technical_skills_ids[2],
              level_id: levels_ids[2]
            }
          ],
          languages: [
            {
              level_id: levels_ids[0],
              language_id: languages_ids[0]
            }
          ]
        }
      end

      it "Should return a modifiend offer" do
        updated_offer = subject.(company: company, update_params: params)

        expect(updated_offer[:data]).to be_an_instance_of(Offer)
      end

      it "Should update the offer" do
        updated_offer = subject.(company: company, update_params: params)

        offer.reload

        expect(offer.city_id).to eq(city.id)
        expect(offer.educational_degree_id).to eq(educational_degree.id)
        expect(offer.required_experience).to be_truthy
        expect(offer.required_experiences_duration).to eq(2)
        expect(offer.required_experiences_duration_type_id).to eq(duration_type.id)

        expect(offer.strong_skills.count).to eq(3)
        expect(offer.strong_languages.count).to eq(1)
      end

      it "should create a offer techical skills object associated to the offer" do
        expect(offer.technical_skills.count).to be_zero
        expect(offer.strong_languages.count).to be_zero

        updated_offer = subject.(company: company, update_params: params)

        offer.reload

        strong_skills = updated_offer[:data].strong_skills

        strong_technical_skills = strong_skills.map { |d| d.technical_skill.description }
        strong_levels = strong_skills.map { |d| d.level.description }

        expect(strong_technical_skills).to match_array(["SEO", "Redes sociales", "Ruby On Rails"])
        expect(strong_levels).to match_array(["avanzado", "avanzado", "bajo"])
      end
    end
  end
end
