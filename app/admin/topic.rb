ActiveAdmin.register Topic do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :description, :logo
  index do
    column :name
    column :description
    column :logo do |topic|
      image_tag(topic.logo.url (:small))
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :logo do
        image_tag(topic.logo.url)
      end
      row :created_at
      row :updated_at
    end
  end

end
