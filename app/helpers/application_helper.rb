module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link = "https://github.com/#{author}/#{repo}"
    link_to 'Test Guru', link, :target => '_blank'
  end

  def flash_message(key)
    content_tag(:p, flash[key], class: "flash #{key}") if flash[key]
  end
end
