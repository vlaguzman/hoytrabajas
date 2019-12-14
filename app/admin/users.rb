ActiveAdmin.register User do

  controller do
    def update_resource object, attributes
      AdminsService.remove_and_update(object, attributes)
    end
  end

  permit_params :email, :name, :last_name, :password, :password_confirmation, :sex_id, :city_id, :about_me, :contact_number

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :last_name
    actions
  end

  filter :name_or_last_name_cont, label: 'Nombre'
  filter :email
  filter :sex, label: 'Genero', as: :select, collection: ListConverter.model_array_list(Sex)

  form do |f|
    f.inputs do
      f.input :name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      unless f.object.new_record?
        f.input :contact_number
        f.input :about_me
        f.input :sex_id, label: 'Genero', as: :select, collection: ListConverter.model_array_list(Sex)
        f.input :work_mode_id, label: 'Modo de trabajo', as: :select, collection: ListConverter.model_array_list(WorkMode)
      end
    end
    f.actions
  end
end
