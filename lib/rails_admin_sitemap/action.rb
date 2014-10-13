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
            `rake sitemap:create`
            flash[:notice] = "Карта сайта обновлена"

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

        register_instance_option :data_confirm do
          "Вы уверены, что хотите перегенерить Sitemap?"
        end
      end
    end
  end
end