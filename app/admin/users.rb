ActiveAdmin.register User do

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
  filter :sex, label: 'Genero', as: :select, collection: Sex.all.map{|s| ["#{s.description}", s.id]} 

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
        f.input :sex_id, label: 'Genero', as: :select, collection: Sex.all.map{|s| ["#{s.description}", s.id]}
        f.input :work_mode_id, label: 'Modo de trabajo', as: :select, collection: WorkMode.all.map{|s| ["#{s.description}", s.id]}
      end
    end
    f.actions
  end 
end
