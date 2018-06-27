# frozen_string_literal: true
module NfgUi
  module Utilities
    require_relative 'utilities/component_groupings'
    require_relative 'utilities/partial_path'

    include ComponentGroupings
    include PartialPath
  end
end
