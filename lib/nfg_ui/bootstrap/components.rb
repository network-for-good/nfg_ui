# frozen_string_literal: true

module NfgUi
  module Bootstrap
    # The manifest of all Bootstrap Components
    module Components
      extend ActiveSupport::Autoload

      autoload :Base

      autoload :Alert
      autoload :Badge
      autoload :Breadcrumb
      autoload :BreadcrumbItem
    end
  end
end
