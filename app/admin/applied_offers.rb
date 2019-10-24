ActiveAdmin.register AppliedOffer do

  permit_params :applied_date, :offer_id, :curriculum_vitae_id, :applied_offer_status_id
  
  index do
    selectable_column
    id_column
    column :offer
    column :curriculum_vitae
    column :applied_date
    actions
  end

end
