require 'test_helper'
require 'generators/rails/my_templates/my_templates_generator'

class Rails::MyTemplatesGeneratorTest < Rails::Generators::TestCase
  tests Rails::MyTemplatesGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
