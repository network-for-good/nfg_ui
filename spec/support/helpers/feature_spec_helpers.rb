# frozen_string_literal: true

module FeatureSpecHelpers
  # Include helpers that empower the test_app/views/feature_spec_views/* 
  # haml files to support rspec
  include ComponentAttributeDefaultsHelper
  include UtilityEnhancedComponentCollectorHelper
end
