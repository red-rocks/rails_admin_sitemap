# RailsAdminSitemap

Integration sitemap generators in rails_admin. Add link to secondary navigation (overridden)

## Installation

Select one of this sitemap gems and install it

    https://github.com/kjvarga/sitemap_generator
    gem "sitemap_generator"

    https://github.com/chr1s1/dynamic_sitemaps
    gem 'dynamic_sitemaps', github: "chr1s1/dynamic_sitemaps" #this fork has fix for Mongoid

    https://github.com/viseztrance/rails-sitemap
    gem "sitemap"

Add this line to your application's Gemfile:

    gem 'rails_admin_sitemap', :github => 'ack43/rails_admin_sitemap'


And then execute:

    $ bundle

## Usage

    RailsAdminSitemap.configure do |config|

      @generator    = :sitemap_generator  # default; also :dynamic_sitemaps or :rails_sitemap
      @config_file  = Rails.root.join("config", "sitemap.rb")   # default
      @output_file  = Rails.root.join("public", "sitemap.xml")  # default for :sitemap_generator and :rails_sitemap

      # default for :dynamic_sitemaps
      @dynamic_sitemaps_conf = {
        path: Rails.root.join("public"),
        folder: "sitemaps",
        index_file_name: "sitemap.xml"
      }
    end

  And configure @config_file for selected gem

## Features

  All you need is install generator and set the config.
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request