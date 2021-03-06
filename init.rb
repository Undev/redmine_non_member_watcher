require 'redmine'

Rails.application.paths['app/overrides'] ||= []
Rails.application.paths['app/overrides'] << File.expand_path('../app/overrides', __FILE__)

Redmine::Plugin.register :redmine_non_member_watcher do
  name 'Redmine Non Member Watcher Plugin'
  author 'Restream'
  description 'This plugins adds "Non member watcher" and "Non member author" system roles to Redmine.'
  version '1.1.0'
  url 'https://github.com/Restream/redmine_non_member_watcher'
  author_url 'https://github.com/Restream'

  project_module :issue_tracking do |map|
    # non_member_watcher
    map.permission :view_watched_issues, { issues: [:show] }
    map.permission :view_watched_issues_list, { issues: [:index] }

    # non_member_author
    map.permission :view_own_issues, { issues: [:show] }, require: :non_member_author
    map.permission :view_own_issues_list, { issues: [:index] }, require: :non_member_author
  end
end

require 'redmine_non_member_watcher'
