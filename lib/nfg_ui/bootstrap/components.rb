# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      p ":::::: #{__FILE__.split('/').last.to_s} :::::: #{__FILE__} :::::: Loaded"
      # require_relative 'components/alert'
      extend ActiveSupport::Autoload

      autoload :Alert

    end
  end
end
