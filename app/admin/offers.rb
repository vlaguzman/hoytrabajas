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
  filter :city, label: 'Ciudad', as: :select, collection: City.all.map{|s| ["#{s.description}", s.id]}
  filter :job_category, label: 'Categoria', as: :select, collection: JobCategory.all.map{|s| ["#{s.description}", s.id]}
  filter :status, label: 'Estado', as: :select, collection: ['active', 'expire']

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title, label: 'Titulo'
      f.input :address, label: 'Dirección'
      f.input :company_id, label: 'Compañía', as: :select, collection: Company.all.map{|c| ["#{c.name}", c.id]}
      f.input :cellphone, label: 'Celular de contacto'
      f.input :description, label: 'Descripción de la oferta'
      f.input :vacancies_quantity, label: 'Cantidad de vacantes'
      f.input :work_mode_id, label: 'Modo de trabajo', as: :select, collection: WorkMode.all.map{|s| ["#{s.description}", s.id]}
      f.input :city_id, label: 'Ciudad', as: :select, collection: City.all.map{|s| ["#{s.description}", s.id]}
      f.input :job_category, label: 'Categoria', as: :select, collection: JobCategory.all.map{|s| ["#{s.description}", s.id]}
      f.input :contract_type, label: 'Tipo de contrato', as: :select, collection: ContractType.all.map{|s| ["#{s.description}", s.id]}
      f.input :required_experience, label: 'Experiencia requerida'
      f.input :immediate_start, label: 'Inicio Inmediato'
      f.input :status, label: 'Estado', collection: ['active', 'expire']
      unless f.object.new_record?
      end
    end
    f.actions
  end
end
