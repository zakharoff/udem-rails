# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://udem-rails.herokuapp.com"
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  add '/activity', :changefreq => 'daily', :priority => 0.9
  add '/analytics', :changefreq => 'daily', :priority => 0.9
  add '/privacy-policy', :changefreq => 'weekly', :priority => 0.9
  Course.find_each do |c|
    add course_path(c), :lastmod => c.updated_at
  end
end
