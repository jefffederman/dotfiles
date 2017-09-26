gem 'dotenv-rails'

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'pry-rails'
end

gem_group :development do
  gem 'awesome_print'
end

application do <<~EOL
  config.generators.assets false
  config.generators.helper false
  config.generators.controller_specs false
  config.generators.view_specs false
  config.generators.orm :active_record, primary_key_type: :uuid
  EOL
end

# bin/rails g rspec:install
# bin/rails g migration enable_pgcrypto_extension ->
# class EnablePgcryptoExtension < ActiveRecord::Migration[5.1]
  # def change
    # enable_extension 'pgcrypto'
  # end
# end
