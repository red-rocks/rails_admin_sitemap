require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class Sitemap < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :root? do
          true
        end

        # register_instance_option :breadcrumb_parent do
        #   nil
        # end

        register_instance_option :controller do
          Proc.new do

            error = nil

            begin

              case RailsAdminSitemap.configuration.generator

                #https://github.com/kjvarga/sitemap_generator
                when :sitemap_generator then
                  ::SitemapGenerator::Interpreter.run(:config_file => RailsAdminSitemap.configuration.config_file)

                #https://github.com/lassebunk/dynamic_sitemaps
                when :dynamic_sitemaps
                  require 'dynamic_sitemaps'
                  DynamicSitemaps.configure do |config|
                    config.path             = RailsAdminSitemap.configuration.dynamic_sitemaps_conf[:path]
                    config.folder           = RailsAdminSitemap.configuration.dynamic_sitemaps_conf[:folder]
                    config.index_file_name  = RailsAdminSitemap.configuration.dynamic_sitemaps_conf[:index_file_name]

                    config.config_path      = RailsAdminSitemap.configuration.config_file
                  end
                  DynamicSitemaps.generate_sitemap

                #https://github.com/viseztrance/rails-sitemap
                when :rails_sitemap
                  require "sitemap"
                  require RailsAdminSitemap.configuration.config_file
                  path = RailsAdminSitemap.configuration.output_file
                  ::Sitemap::Generator.instance.build!
                  ::Sitemap::Generator.instance.save path

                else
                  error = t("admin.actions.sitemap.incorrect_generator")
              end

            rescue Exception => ex
              error = ex.message
              error ||= t("admin.actions.sitemap.unknown_error")
            end

            if error.blank?
              flash[:notice]  = t("admin.actions.sitemap.done")
            else
              flash[:error]   = error
            end

            redirect_to dashboard_path
          end
        end

        register_instance_option :statistics? do
          false
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :http_methods do
          [:post]
        end
      end
    end
  end
end