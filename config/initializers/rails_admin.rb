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

  ### Popular gems integration

  config.authenticate_with do
    warden.authenticate! scope: :user
  end

  config.current_user_method(&:current_user)

  config.authorize_with do
    (redirect_to main_app.authenticated_root_path, notice: "Brak uprawnień administratora.") unless current_user.admin?
  end

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.default_items_per_page = 8

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    #show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
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
  end

  config.model 'User' do
    object_label_method do
      :custom_label_method
    end
  end

  config.model 'Animal' do
    object_label_method do
      :custom_label_method
    end
  end

  config.model 'Appointment' do
    object_label_method do
      :custom_label_method
    end
  end

  config.model 'Disease' do
    object_label_method do
      :custom_label_method
    end
  end

  config.model 'Medical_record' do
    object_label_method do
      :custom_label_method
    end
  end

  config.model 'Medicine' do
    object_label_method do
      :custom_label_method
    end
  end

  config.model 'Picture' do
    object_label_method do
      :custom_label_method
    end
  end

  config.model 'Species' do
    object_label_method do
      :custom_label_method
    end
  end

  config.model 'Tretment' do
    object_label_method do
      :custom_label_method
    end
  end

  config.model 'Unit' do
    object_label_method do
      :custom_label_method
    end
  end

  config.model 'Vacation' do
    object_label_method do
      :custom_label_method
    end
  end

  config.model 'Veterinarian' do
    object_label_method do
      :custom_label_method
    end
  end

  config.model 'WorkingDay' do
    object_label_method do
      :custom_label_method
    end
  end
end
