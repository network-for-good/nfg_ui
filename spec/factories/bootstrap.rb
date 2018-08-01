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
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:alert, attributes) }
    end
  end

  factory :bootstrap_badge, class: NfgUi::Bootstrap::Components::Badge do
    body nil
    data nil
    id nil
    pill { nil }
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:badge, attributes) }
    end
  end

  factory :bootstrap_breadcrumb, class: NfgUi::Bootstrap::Components::Breadcrumb do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:breadcrumb, attributes) }
    end
  end

  factory :bootstrap_breadcrumb_item, class: NfgUi::Bootstrap::Components::BreadcrumbItem do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:breadcrumb_item, attributes) }
    end
  end

  factory :bootstrap_button_group, class: NfgUi::Bootstrap::Components::ButtonGroup do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:button_group, attributes) }
    end
  end

  factory :bootstrap_button_toolbar, class: NfgUi::Bootstrap::Components::ButtonToolbar do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:button_toolbar, attributes) }
    end
  end

  factory :bootstrap_card, class: NfgUi::Bootstrap::Components::Card do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:card, attributes) }
    end
  end

  factory :bootstrap_carousel, class: NfgUi::Bootstrap::Components::Carousel do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:carousel, attributes) }
    end
  end

  factory :bootstrap_dropdown, class: NfgUi::Bootstrap::Components::Dropdown do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:dropdown, attributes) }
    end
  end

  factory :bootstrap_embed, class: NfgUi::Bootstrap::Components::Embed do
    body nil
    data nil
    id nil
    aspect_ratio { '16:9' }
    traits []
    iframe { 'http://www.google.com' }
    autoplay { false }

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:embed, attributes) }
    end
  end

  factory :bootstrap_form, class: NfgUi::Bootstrap::Components::Form do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:form, attributes) }
    end
  end

  factory :bootstrap_input_group, class: NfgUi::Bootstrap::Components::InputGroup do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:input_group, attributes) }
    end
  end

  factory :bootstrap_jumbotron, class: NfgUi::Bootstrap::Components::Jumbotron do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:jumbotron, attributes) }
    end
  end

  factory :bootstrap_list_group, class: NfgUi::Bootstrap::Components::ListGroup do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:list_group, attributes) }
    end
  end

  factory :bootstrap_list_group_item, class: NfgUi::Bootstrap::Components::ListGroupItem do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:list_group_item, attributes) }
    end
  end

  factory :media_object, class: NfgUi::Bootstrap::Components::MediaObject do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:media_object, attributes) }
    end
  end

  factory :bootstrap_modal, class: NfgUi::Bootstrap::Components::Modal do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:modal, attributes) }
    end
  end

  factory :bootstrap_nav, class: NfgUi::Bootstrap::Components::Nav do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:nav, attributes) }
    end
  end

  factory :bootstrap_navbar, class: NfgUi::Bootstrap::Components::Navbar do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:navbar, attributes) }
    end
  end

  factory :bootstrap_pagination, class: NfgUi::Bootstrap::Components::Pagination do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:pagination, attributes) }
    end
  end

  factory :bootstrap_popover, class: NfgUi::Bootstrap::Components::Popover do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:popover, attributes) }
    end
  end

  factory :bootstrap_progress, class: NfgUi::Bootstrap::Components::Progress do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:progress, attributes) }
    end
  end

  factory :bootstrap_table, class: NfgUi::Bootstrap::Components::Table do
    body nil
    data nil
    id nil
    traits []

    skip_create
    initialize_with { new(attributes, ActionController::Base.new.view_context) }

    trait :rendered do
      initialize_with { NfgUi::UI::Base.new(ActionController::Base.new.view_context)
                                       .bootstrap(:table, attributes) }
    end
  end
end
