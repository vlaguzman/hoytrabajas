ActiveAdmin.register Company do

  controller do
    def update_resource object, attributes
      AdminsService.remove_and_update(object, attributes)
    end
  end

  permit_params :name, :contact_name, :cellphone, :contact_cellphone, :nit, :address, :web_site, :contact_web_site, :description, :contact_work_position, :email, :password, :password_confirmation, :employees_range_id, :city_id, :logo

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :contact_name
    column :contact_cellphone
    actions
  end

  filter :name, label: 'Nombre'
  filter :contact_name, label: 'Nombre'
  filter :email
  filter :city, label: 'Ciudad', as: :select, collection: ListConverter.model_array_list(City)

  form do |f|
    f.inputs do
      f.input :logo, as: :file
      f.input :name, label: t('admin.companies.form.name')
      f.input :description, label: t('admin.companies.form.description')
      f.input :email, label: t('admin.companies.form.email')
      f.input :password, label: t('admin.companies.form.password')
      f.input :password_confirmation, label: t('admin.companies.form.password_confirmation')
      f.input :city_id, label: t('admin.companies.form.city'), as: :select, collection: ListConverter.model_array_list(City)
      unless f.object.new_record?
        f.input :contact_name, label: t('admin.companies.form.contact_name')
        f.input :contact_work_position, label: t('admin.companies.form.contact_work_position')
        f.input :contact_cellphone, label: t('admin.companies.form.contact_cellphone')
        f.input :nit, label: t('admin.companies.form.nit')
        f.input :address, label: t('admin.companies.form.address')
        f.input :web_site, label: t('admin.companies.form.web_site')
      end
    end
    f.actions
  end

end
