require 'rake'

task load_permissions: :environment do
  Ability::AUTHORIZED_MODELS.each do |model|
    %w[create read update destroy].map do |action|
      Permission.create(target_model_name: model.name, action: action)
    end
  end
end
