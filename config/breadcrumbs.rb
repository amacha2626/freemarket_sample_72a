crumb :root do
  link "トップ", root_path
end

crumb :login do
  link "ログイン", new_user_session_path
  parent:root
end

crumb :signup do 
  link "新規会員登録", new_user_registration_path
  parent:root
end

crumb :categories do 
  link "カテゴリー", categories_path
  parent:root
end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).