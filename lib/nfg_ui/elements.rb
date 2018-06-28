# frozen_string_literal: true

module NfgUi
  # The list of design system components within
  # the 'Element' grouping.
  #
  # This is the authoritative document for 'Elements'
  module Elements
    p ":::::: #{__FILE__.split('/').last.to_s} :::::: #{__FILE__} :::::: Loaded"
    extend ActiveSupport::Autoload
    autoload :Alert
  end
end
