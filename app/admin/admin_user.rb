ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :admin

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :username
      row :email
      row :avatar do
        image_tag(user.avatar.url)
      end
      row :remember_created_at
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :admin
      row :invitation_token
      row :invitation_created_at
      row :invitation_sent_at
      row :invitation_accepted_at
      row :invitation_limit
    end
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin
    end
    f.actions
  end

end
