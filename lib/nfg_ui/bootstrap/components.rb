# frozen_string_literal: true

module NfgUi
  module Bootstrap
    # The manifest of all Bootstrap Components
    module Components
      extend ActiveSupport::Autoload

      autoload :Alert
      autoload :Base
      autoload :Badge
      autoload :Breadcrumb
      autoload :BreadcrumbItem
      autoload :Button
    end
  end
end
