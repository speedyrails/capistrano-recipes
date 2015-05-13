# Collection of example capistrano recipes examples

The following is a collection of capistrano recipes examples we use.

To use this recipes:

* Add the gems in Gemfile to your application's Gemfile.
* Copy `Capfile`, `config/deploy.rb` and `config/deploy/*.rb` to your application's directory.
* Modify `config/deploy.rb` to match your application settings.
* Modify `config/deploy/production.rb` or `config/deploy/staging.rb` to match your servers settings.
* Run `bundle exec cap production deploy`
