require 'rails_helper'

RSpec.describe RecommendationsTechnicalSkills, type: :model do

  describe "associations" do
    it  { should belong_to(:recommendation) }
    it  { should belong_to(:technical_skill) }
  end
end