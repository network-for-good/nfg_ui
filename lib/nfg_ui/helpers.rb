# frozen_string_literal: true

module NfgUi
  module Helpers
    p ":::::: #{__FILE__.split('/').last.to_s} :::::: #{__FILE__} :::::: Loaded"
    extend ActiveSupport::Autoload
    autoload :Render
  end
end
