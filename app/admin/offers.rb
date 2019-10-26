ActiveAdmin.register Offer do

  permit_params :title, :address, :cellphone, :description, :vacancies_quantity, :close_date, :immediate_start, :required_experience, :release_date, :status, :city_id, :job_category_id, :offer_type_id, :contract_type_id, :work_mode_id, :sex_id, :company_id

  index do
    selectable_column
    id_column
    column :title
    column :vacancies_quantity
    column :immediate_start
    column :required_experience
    column :status
    actions
  end

  filter :title, label: 'Titulo'
  filter :required_experience, as: :check_boxes, collection: [['Experiencia requerida', true]], label: ''
  filter :immediate_start, as: :check_boxes, collection: [['Inicio Inmediato', true]], label: ''
  filter :job_category, label: 'Categoria', as: :select, collection: ListConverter.model_array_list(JobCategory)
  filter :city, label: 'Ciudad', as: :select, collection:  ListConverter.model_array_list(City)
  filter :status, label: 'Estado', as: :select, collection: ['active', 'expire']

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title, label: t('admin.offers.form.title')
      f.input :address, label: t('admin.offers.form.address')
      f.input :company_id, label: t('admin.offers.form.company'), as: :select, collection: ListConverter.model_array_list(Company, :name)
      f.input :cellphone, label: t('admin.offers.form.cellphone')
      f.input :description, label: t('admin.offers.form.offer_description')
      f.input :vacancies_quantity, label: t('admin.offers.form.vacancies_quantity')
      f.input :work_mode_id, label: t('admin.offers.form.work_mode'), as: :select, collection: ListConverter.model_array_list(WorkMode)
      f.input :city_id, label: t('admin.offers.form.city'), as: :select, collection: ListConverter.model_array_list(City)
      f.input :job_category, label: t('admin.offers.form.job_category'), as: :select, collection: ListConverter.model_array_list(JobCategory)
      f.input :contract_type, label: t('admin.offers.form.contract_type'), as: :select, collection: ListConverter.model_array_list(ContractType)
      f.input :required_experience, label: t('admin.offers.form.required_experience')
      f.input :immediate_start, label: t('admin.offers.form.inmediate_start')
      f.input :status, label: t('admin.offers.form.status.label'), collection: ['active', 'expire']
      unless f.object.new_record?
      end
    end
    f.actions
  end
end
