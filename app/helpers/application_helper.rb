module ApplicationHelper

  def current_year
    Date.current.year 
  end

  def github_url(author, repo)
    link_to "#{repo}", "https://github.com/#{author}/#{repo}", target: :_blank
  end

# helper insted partial for flash messages
  def flash_message
    flash.map do |message_type, message|
      content_tag(:p, message, class: "alert alert-#{message_type}")
    end.join.html_safe
  end

  def log_in_out
    if logged_in?
      link_to 'Logout', logout_path
    else
      link_to "Log in", login_path
    end
  end

  def strip_hash(url)
    URI(url).path
  end

  def user_nav_theme
    (user_signed_in? && current_user.admin?) ? "navbar navbar-light bg-warning " : "navbar navbar-light bg-light"
  end
end
