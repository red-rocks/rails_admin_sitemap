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
                  #temporary solution
                  `rake sitemap:generate`

                  #todo fixit
                  # require 'dynamic_sitemaps'
                  #
                  # #https://github.com/lassebunk/dynamic_sitemaps/issues/25
                  # if !defined?(ActiveRecord) and !defined?(ActiveRecord::Base) or !defined?(DynamicSitemaps::SitemapGenerator::ActiveRecord::Base)
                  #   module DynamicSitemaps
                  #     class SitemapGenerator
                  #       class ActiveRecord
                  #         class Base
                  #         end
                  #       end
                  #     end
                  #   end
                  # end
                  # ::DynamicSitemaps.generate_sitemap

                #https://github.com/viseztrance/rails-sitemap
                when :rails_sitemap
                  #temporary solution
                  `rake sitemap:generate`
                  #todo fixit
                  # ::Sitemap::Generator.instance.fragments.each do |f| FileUtils.rm(f) if Pathname.new(f).exist? end
                  # ::Sitemap::Generator.instance.fragments = []
                  # ::Sitemap::Generator.instance.store.reset!
                  #
                  # load RailsAdminSitemap.configuration.config_file
                  # ::Sitemap::Generator.instance.build!
                  # ::Sitemap::Generator.instance.save(RailsAdminSitemap.configuration.output_file)

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