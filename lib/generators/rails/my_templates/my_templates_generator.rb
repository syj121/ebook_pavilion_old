  require "rails/generators/erb"
  require "rails/generators/resource_helpers"
  require "rails/generators/named_base"
  require "rails/generators/active_model"
  require "rails/generators/active_record/migration"
  require "active_record"

  #默认的scaffold，只生成固定的5个views，因此，如果需要额外添加页面，需要重新定义生成器
  class Rails::MyTemplatesGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('templates', __dir__)

    include Rails::Generators::ResourceHelpers
    include ActiveRecord::Generators::Migration

    #argument :attributes, type: :array, default: [], banner: "field:type field:type"

    argument :attributes, type: :array, default: [], banner: "field[:type][:index] field[:type][:index]"

    check_class_collision

    class_option :migration, type: :boolean, default: true 
    class_option :timestamps, type: :boolean, default: true
    class_option :parent, type: :string, desc: "The parent class for the generated model"
    class_option :indexes, type: :boolean, default: true, desc: "Add indexes for references and belongs_to columns"
    class_option :primary_key_type, type: :string, desc: "The type for primary key"

    class_option :orm, banner: "NAME", type: :string, required: true,
                         desc: "ORM to generate the controller for"

    def create_root_folder
      empty_directory File.join("app/views", controller_file_path)
    end

    def create_model_file
      template "model/model.rb", File.join("app/models", class_path, "#{file_name}.rb")
    end

    def copy_view_files
      available_views.each do |view|
        template "views/#{view}", File.join("app/views", controller_file_path, view)
      end
    end

    def create_controller_files
      template "controller/controller.rb", File.join("app/controllers", controller_class_path, "#{controller_file_name}_controller.rb")
    end

    def create_migration_file
      return unless options[:migration] && options[:parent].nil?
      attributes.each { |a| a.attr_options.delete(:index) if a.reference? && !a.has_index? } if options[:indexes] == false
      migration_template "migration/migration.rb", File.join("db/migrate", "create_#{table_name}.rb")
    end


    def create_policy_files
       template "policy/policy.rb", File.join("app/policies", "#{file_name}_policy.rb")
    end


    private
      def available_views
        base = File.join(Rails.root, 'lib', 'generators', "rails", "my_templates", "templates", "views", File::SEPARATOR)
        base_len = base.length
        Dir[File.join(base, '**', '*')].select { |f| File.file?(f) }.map{|f| f[base_len..-1]}
      end

      def attributes_with_index
        attributes.select { |a| !a.reference? && a.has_index? }
      end

      # Used by the migration template to determine the parent name of the model
      def parent_class_name
        options[:parent] || "ApplicationRecord"
      end

  end