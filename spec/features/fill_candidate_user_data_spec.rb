require 'rails_helper'

RSpec.describe "fill the principal canditate user data", :type => :feature do
  context "like a candidate user in his first login" do
    xit "should see the info to fill and the next button in each section" do
      expect(User.count).to eq 0
      
      expect(page).to have_text("Empecemos por conocernos")
      fill_in "name", :with => "Carlos"
      fill_in "last_name", :with => "Rojas"
      page.select 'nationality', from: 'Colombia'
      page.select 'document_type', from: 'Cedula de ciudadania'
      fill_in "document_number", :with => "1063558224"
      fill_in "contact_number", :with => "3183638789"
      click_button 'siguiente'
      
      expect(User.count).to eq 1
      expect(CurriculumVitae.count).to eq 1
      
      expect(page).to have_text("Empecemos por conocernos")
      fill_in "about_you", :with => "I am the best chef in the world"
      page.select 'masculino', from: 'gender'
      fill_in "birthday", :with => "1990/01/01"
      page.select 'ninguna', from: 'special_condition'
      page.select 'Profesional', from: 'education'
      click_button 'siguiente'
      
      candidate = User.first
      curriculum = candidate.curriculum
      expect(curriculum.gender.description).to eq("male")
    end
  end
end
