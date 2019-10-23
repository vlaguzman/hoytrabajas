ActiveAdmin.register CurriculumVitae do

  permit_params :area_code, :about_me, :release_date, :travel_disponibility, :visits_count, :user_id, :city_id, :labor_disponibility_id, :work_mode_id, :contract_type_id
  
  index do
    selectable_column
    id_column
    column :user
    column :city
    actions
  end
end
