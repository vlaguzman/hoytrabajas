require 'rails_helper'

RSpec.describe RecommendationsSoftSkills, type: :model do

  describe "associations" do
    it  { should belong_to(:recommendation) }
    it  { should belong_to(:soft_skill) }
  end
end