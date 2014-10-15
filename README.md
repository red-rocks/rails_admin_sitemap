# RailsAdminSitemap

Integration sitemap generators in rails_admin. Add link to secondary navigation (overridden)

## Installation

Add this line to your application's Gemfile:

    gem 'rails_admin_sitemap', :github => 'ack43/rails_admin_sitemap'

And then execute:

    $ bundle

## Usage

RailsAdminSitemap.config do |config|
  config.generator    = :sitemap_generator # default; also :dynamic_sitemaps or :rails_sitemap
  config.config_file  = Rails.root.join("config", "sitemap.rb")  # default; for sitemap_generator and rails_sitemap (in future) gems
  config.output_file  = Rails.root.join("public", "sitemap.xml") # default; for rails_sitemap gem (in future)
end

## Features

  Default sitemap_generator work perfectly. Any generators use rake task so it is needed to fix. 
  
  All you need is install generator and set the config.
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request