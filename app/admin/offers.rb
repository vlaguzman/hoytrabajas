ActiveAdmin.register Offer do

  permit_params :title, :address, :cellphone, :description, :vacancies_quantity, :close_date, :immediate_start, :required_experience, :release_date, :status, :city_id, :offer_type_id, :contract_type_id, :work_mode_id, :sex_id, :company_id, job_category_ids: []

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

  filter :company_name, as: :string, label: 'Nombre compañia'
  filter :company_email, as: :string, label: 'Correo compañia'
  filter :title, label: 'Titulo'
  filter :required_experience, as: :check_boxes, collection: [['Experiencia requerida', true]], label: ''
  filter :immediate_start, as: :check_boxes, collection: [['Inicio Inmediato', true]], label: ''
  filter :job_categories, label: 'Categoria', as: :select, collection: ListConverter.model_array_list(JobCategory)
  filter :city, label: 'Ciudad', as: :select, collection:  ListConverter.model_array_list(City)
  filter :status, label: 'Estado', as: :select, collection: ['active', 'expired', 'hired']

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title, label: t('admin.offers.form.title')
      f.input :address, label: t('admin.offers.form.address')
      #TODO Oscar Show the name when de value is selected
      f.input :company_id, as: :datalist, collection: ListConverter.model_array_list(Company, :name, order_by: :name), :input_html => { autoComplete: "off" } 
      f.input :cellphone, label: t('admin.offers.form.cellphone')
      f.input :description, label: t('admin.offers.form.offer_description')
      f.input :vacancies_quantity, label: t('admin.offers.form.vacancies_quantity')
      f.input :work_mode_id, label: t('admin.offers.form.work_mode'), as: :select, collection: ListConverter.model_array_list(WorkMode)
      f.input :city_id, label: t('admin.offers.form.city'), as: :select, collection: ListConverter.model_array_list(City)
      f.input :job_category_ids, label: t('admin.offers.form.job_category'), as: :select, :input_html => { :multiple => true, :size => 10 }, collection: ListConverter.model_array_list(JobCategory)
      f.input :contract_type, label: t('admin.offers.form.contract_type'), as: :select, collection: ListConverter.model_array_list(ContractType)
      f.input :required_experience, label: t('admin.offers.form.required_experience')
      f.input :immediate_start, label: t('admin.offers.form.inmediate_start')
      f.input :status, label: t('admin.offers.form.status.label'), collection: ['active', 'expire']
      f.input :close_date, as: :date_time_picker, datepicker_options: { min_date: "2019-11-1" }
      unless f.object.new_record?
      end
    end
    f.actions
  end
end
