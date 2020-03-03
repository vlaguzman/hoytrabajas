ActiveAdmin.register AppliedOffer do
  before_create do |applied_offer|
    applied_offer.applied_date = Time.now
  end

  permit_params :applied_date, :offer_id, :curriculum_vitae_id, :applied_offer_status_id

  index do
    selectable_column
    id_column
    column :offer
    column :curriculum_vitae
    column :applied_date
    actions
  end

  filter :curriculum_vitae_user_email, as: :string, label: I18n.t('admin.applied_offers.form.curriculum_vitae_user_email')

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :offer_id, label: t('admin.applied_offers.form.offer_title'), as: :select, collection: ListConverter.model_array_list(Offer, :title)
      f.input :curriculum_vitae_id, label: t('admin.applied_offers.form.curriculum_vitae_user_email'), as: :select, collection: ListConverter.model_array_list(CurriculumVitae, :user_email)
      f.input :applied_offer_status, label: t('admin.applied_offers.form.status'), collection: ListConverter.model_array_list(AppliedOfferStatus)
    end
    f.actions
  end
end
