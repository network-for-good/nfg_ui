# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      p ":::::: #{__FILE__.split('/').last.to_s} :::::: #{__FILE__} :::::: Loaded"
      # require_relative 'utilities/themeable'
      extend ActiveSupport::Autoload

      autoload :Themeable
    end
  end
end
