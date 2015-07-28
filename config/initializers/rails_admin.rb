module ActiveRecord
  module RailsAdminEnum
    def enum(definitions)
      super

      definitions.each do |name, values|
        define_method("#{ name }_enum") { self.class.send(name.to_s.pluralize).to_a }

        define_method("#{ name }=") do |value|
          if value.kind_of?(String) and value.to_i.to_s == value
            super value.to_i
          else
            super value
          end
        end
      end
    end
  end
end

ActiveRecord::Base.send(:extend, ActiveRecord::RailsAdminEnum)


RailsAdmin.config do |config|

  config.authenticate_with do
    warden.authenticate! scope: :user
  end

  config.current_user_method(&:current_user)

  config.authorize_with do
    (redirect_to main_app.authenticated_root_path, notice: "Brak uprawnień administratora.") unless current_user.admin?
  end

  config.default_items_per_page = 8

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
  end

  config.model 'Address' do
    configure :user do
      label "użytkownik"
    end

    object_label_method do
      :custom_label_method
    end

    list do
      field :id
      field :street
      field :house_number
      field :flat_number
      field :zip_code
      field :city
      field :borough
      field :district
      field :province
      field :country
      field :user
      field :created_at
      field :updated_at
    end

    edit do
      field :street
      field :house_number
      field :flat_number
      field :zip_code
      field :city
      field :borough
      field :district
      field :province
      field :country do
        help 'Opcjonalne. (Wpisz skrót państwa)'
      end
      field :user do
        inline_add false
        inline_edit false
      end
    end

    show do
      field :id
      field :street
      field :house_number
      field :flat_number
      field :zip_code
      field :city
      field :borough
      field :district
      field :province
      field :country
      field :user
      field :created_at
      field :updated_at
    end

    export do
      field :id
      field :street
      field :house_number
      field :flat_number
      field :zip_code
      field :city
      field :borough
      field :district
      field :province
      field :country
      field :created_at
      field :updated_at
      field :user
    end
  end

  config.model 'User' do
    object_label_method do
      :custom_label_method
    end

    list do
      field :id
      field :created_at
      field :updated_at
    end

    show do
      field :id
      field :created_at
      field :updated_at
    end

    edit do

    end

    export do
      field :id
      field :created_at
      field :updated_at
    end
  end

  config.model 'Animal' do
    object_label_method do
      :custom_label_method
    end

    list do
      field :id
      field :created_at
      field :updated_at
    end

    show do
      field :id
      field :created_at
      field :updated_at
    end

    edit do

    end

    export do
      field :id
      field :created_at
      field :updated_at
    end
  end

  config.model 'Appointment' do
    object_label_method do
      :custom_label_method
    end

    list do
      field :id
      field :created_at
      field :updated_at
    end

    show do
      field :id
      field :created_at
      field :updated_at
    end

    edit do

    end

    export do
      field :id
      field :created_at
      field :updated_at
    end
  end

  config.model 'Disease' do
    configure :medical_records do
      label "karty użytkowników"
    end

    object_label_method do
      :custom_label_method
    end

    list do
      field :id
      field :name
      field :medical_records
      field :created_at
      field :updated_at
    end

    show do
      field :id
      field :name
      field :medical_records
      field :created_at
      field :updated_at
    end

    edit do
      field :name
      field :medical_records do
        inline_add false
      end
    end

    export do
      field :id
      field :name
      field :created_at
      field :updated_at
      field :medical_records
    end
  end

  config.model 'MedicalRecord' do
    object_label_method do
      :custom_label_method
    end

    list do
      field :id
      field :created_at
      field :updated_at
    end

    show do
      field :id
      field :created_at
      field :updated_at
    end

    edit do

    end

    export do
      field :id
      field :created_at
      field :updated_at
    end
  end

  config.model 'Medicine' do
    object_label_method do
      :custom_label_method
    end

    list do
      field :id
      field :created_at
      field :updated_at
    end

    show do
      field :id
      field :created_at
      field :updated_at
    end

    edit do

    end

    export do
      field :id
      field :created_at
      field :updated_at
    end
  end

  config.model 'Picture' do
    object_label_method do
      :custom_label_method
    end

    list do
      field :id
      field :created_at
      field :updated_at
    end

    show do
      field :id
      field :created_at
      field :updated_at
    end

    edit do

    end

    export do
      field :id
      field :created_at
      field :updated_at
    end
  end

  config.model 'Species' do
    object_label_method do
      :custom_label_method
    end

    list do
      field :id
      field :created_at
      field :updated_at
    end

    show do
      field :id
      field :created_at
      field :updated_at
    end

    edit do

    end

    export do
      field :id
      field :created_at
      field :updated_at
    end
  end

  config.model 'Tretment' do
    object_label_method do
      :custom_label_method
    end

    list do
      field :id
      field :created_at
      field :updated_at
    end

    show do
      field :id
      field :created_at
      field :updated_at
    end

    edit do

    end

    export do
      field :id
      field :created_at
      field :updated_at
    end
  end

  config.model 'Unit' do
    object_label_method do
      :custom_label_method
    end

    list do
      field :id
      field :created_at
      field :updated_at
    end

    show do
      field :id
      field :created_at
      field :updated_at
    end

    edit do

    end

    export do
      field :id
      field :created_at
      field :updated_at
    end
  end

  config.model 'Vacation' do
    object_label_method do
      :custom_label_method
    end

    list do
      field :id
      field :created_at
      field :updated_at
    end

    show do
      field :id
      field :created_at
      field :updated_at
    end

    edit do

    end

    export do
      field :id
      field :created_at
      field :updated_at
    end
  end

  config.model 'Veterinarian' do
    object_label_method do
      :custom_label_method
    end

    list do
      field :id
      field :created_at
      field :updated_at
    end

    show do
      field :id
      field :created_at
      field :updated_at
    end

    edit do

    end

    export do
      field :id
      field :created_at
      field :updated_at
    end
  end

  config.model 'WorkingDay' do
    configure :veterinarian do
     label 'weterynarz'
    end

    object_label_method do
      :custom_label_method
    end

    list do
      field :id
      field :veterinarian
      field :monday
      field :tuesday
      field :wednesday
      field :thursday
      field :friday
      field :saturday
      field :sunday
      field :created_at
      field :updated_at
    end

    show do
      field :id
      field :veterinarian
      field :monday
      field :tuesday
      field :wednesday
      field :thursday
      field :friday
      field :saturday
      field :sunday
      field :created_at
      field :updated_at
    end

    edit do
      field :veterinarian do
        inline_add false
        inline_edit false
      end
      field :monday
      field :tuesday
      field :wednesday
      field :thursday
      field :friday
      field :saturday
      field :sunday
    end

    export do
      field :id
      field :monday
      field :tuesday
      field :wednesday
      field :thursday
      field :friday
      field :saturday
      field :sunday
      field :created_at
      field :updated_at
      field :veterinarian
    end
  end
end
