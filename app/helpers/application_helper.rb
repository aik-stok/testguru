module ApplicationHelper

  def current_year
    Date.current.year 
  end

  def github_url(author, repo)
    link_to "#{repo}", "https://github.com/#{author}/#{repo}", target: :_blank
  end

  def flash_message
    flash.map do |message_type, message|
      content_tag(:p, message, class: "flash #{message_type}")
    end.join.html_safe
  end

  def log_in_out
    if logged_in?
      link_to 'Logout', logout_path
    else
      link_to "Log in", login_path
    end
  end
end
