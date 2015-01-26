module RailsAdminSitemap
  def self.configuration
    @configuration ||= Configuration.new
  end
  def self.config
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  class Configuration
    attr_accessor :generator
    attr_accessor :config_file
    attr_accessor :output_file
    attr_accessor :dynamic_sitemaps_conf

    def initialize
      @generator    = :sitemap_generator
      @config_file  = Rails.root.join("config", "sitemap.rb")
      @output_file  = Rails.root.join("public", "sitemap.xml")

      @dynamic_sitemaps_conf = {
        path: Rails.root.join("public"),
        folder: "sitemaps",
        index_file_name: "sitemap.xml"
      }
    end
  end
end