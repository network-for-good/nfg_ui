# Additional info on using FactoryBot without an ORM
# https://robots.thoughtbot.com/tips-for-using-factory-girl-without-an-orm
FactoryBot.define do
  factory :nfg_modal, class: NfgUi::Components::Patterns::Modal do
    body { nil }
    data { nil }
    id { nil }
    traits { [] }

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:modal, attributes) }
    end
  end
end
