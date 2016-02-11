# Rails GAP
Base Project\
Ruby: ruby-2.3.0 \
Rails: Rails 4.2.5

## How to run the base project
Request the database.yml and omniauth.yml and place them in the config folder.
```
$ rails s
```
## How to create new engines
1. Create an engine in the specific repo.
```
$ rails plugin new <name> --mountable --skip-test-unit --dummy-path=spec/dummy
```
2. Update required attributes on <name>.gemspec.
3. Update the application layout to inherit the base project layout.
```ruby
<%= content_for :page_title do %>
  RAILS-GAP <engine>
<% end %>

<%= content_for :engine_css do %>
  <%= stylesheet_link_tag "<engine>/application", media: "all" %>
<% end %>

<%= content_for :engine_js do %>
  <%= javascript_include_tag "<engine>/application.js" %>
<% end %>

<%= render layout: 'layouts/application' do %>
  <%= yield %>
<% end %>
```
4. Inherit the main controller from base project and add the device authentication:
```
class ApplicationController < ::ApplicationController
  layout <engine>/<engine>
  before_action :authenticate_user!
  ...
end
```
### Base project changes
1. Add the new engine gem to the gemfile:
> gem '<name>', git: 'github.com/rails-gap/<name>.git'
2. Install the gem reference:
```
$ bundle install
```
Note1: For local development point to path: '../<name>' instead of the git link.\
Note2: Do not run bundle update or all the gems will be updated.

2. Mount the engine in the routes file:
```ruby
$ mount <name>::Engine, at: '/<name>'
```
3. Keep in mind to copy the migrations to the main folder in the base project.
```
$ rake <name>:install:migrations
```

## More info
- Engines: https://www.youtube.com/watch?v=Rm8Jp7VqZTU
- GIT process: https://www.youtube.com/watch?v=KisdaffHLJc
