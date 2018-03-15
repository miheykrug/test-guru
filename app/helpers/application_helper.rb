module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link = "https://github.com/#{author}/#{repo}"
    link_to 'Test Guru', link, :target => '_blank'
  end

  def flash_messages
    html = ''
    flash.each { |key, value| html << content_tag(:p, value, class: "flash #{key}") }
    html.html_safe
  end
end
