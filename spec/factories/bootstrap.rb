# Additional info on using FactoryBot without an ORM
# https://robots.thoughtbot.com/tips-for-using-factory-girl-without-an-orm
FactoryBot.define do
  factory :bootstrap_alert, class: NfgUi::Bootstrap::Components::Alert do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context).bootstrap(:alert, attributes) }
    end
  end

  factory :bootstrap_badge, class: NfgUi::Bootstrap::Components::Badge do
    body nil
    data nil
    id nil
    # pill {nil}
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context).bootstrap(:badge, attributes) }
    end
  end
end
