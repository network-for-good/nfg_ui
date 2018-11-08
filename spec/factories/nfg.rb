# Additional info on using FactoryBot without an ORM
# https://robots.thoughtbot.com/tips-for-using-factory-girl-without-an-orm
FactoryBot.define do
  factory :base, class: NfgUi::Components::Base do
    id { nil }
    data { nil }
    body { nil }

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }
  end

  factory :alert, class: NfgUi::Components::Elements::Alert do
    body { nil }
    data { nil }
    id { nil }
    # traits { [:secondary] }

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .nfg(:alert, attributes) }
    end
  end
  
  factory :button, class: NfgUi::Components::Elements::Button do
    body { nil }
    data { nil }
    id { nil }
    traits { [] }

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .nfg(:button, attributes) }
    end
  end

  factory :icon, class: NfgUi::Components::Foundations::Icon do
    text { nil }
    icon { nil }
    id { nil }
    right { nil }
    traits { [] }

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .nfg(:icon, attributes) }
    end
  end

  factory :modal, class: NfgUi::Components::Patterns::Modal do
    body { nil }
    data { nil }
    id { nil }
    traits { [] }

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .nfg(:modal, attributes) }
    end
  end

  factory :page_header, class: NfgUi::Components::Patterns::PageHeader do
    body { nil }
    data { nil }
    id { nil }
    traits { [] }

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .nfg(:page_header, attributes) }
    end
  end

  factory :tile, class: NfgUi::Components::Patterns::Tile do
    body { nil }
    data { nil }
    id { nil }
    traits { [] }

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .nfg(:tile, attributes) }
    end
  end

  factory :tile_body, class: NfgUi::Components::Patterns::TileBody do
    body { nil }
    data { nil }
    id { nil }
    traits { [] }

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .nfg(:tile_body, attributes) }
    end
  end

  factory :tile_header, class: NfgUi::Components::Patterns::TileHeader do
    body { nil }
    data { nil }
    id { nil }
    traits { [] }

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .nfg(:tile_header, attributes) }
    end
  end

  factory :tile_section, class: NfgUi::Components::Patterns::TileSection do
    body { nil }
    data { nil }
    id { nil }
    traits { [] }

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .nfg(:tile_section, attributes) }
    end
  end

  factory :typeface, class: NfgUi::Components::Foundations::Typeface do
    body { nil }
    data { nil }
    id { nil }
    traits { [] }

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .nfg(:typeface, attributes) }
    end
  end
end
