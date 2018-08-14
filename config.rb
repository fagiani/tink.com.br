::Sass.load_paths << File.join(root, "node_modules")

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end
activate :sprockets
activate :i18n, :mount_at_root => :pt
activate :directory_indexes
activate :livereload

# After configuration loaders
after_configuration do
  sprockets.append_path "node_modules"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  def nav_active(path)
    current_page.path == "#{I18n.locale}/" + path || current_page.path == path
  end

  def locale_path(path, options={})
    lang = options[:language] ? options[:language] : I18n.locale.to_s
    lang = '' if lang == 'pt'
    path = t("paths.#{path}") unless path == '/'
    "/#{lang}/#{path}".gsub(/\/+/,'/')
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  sprockets.append_path "node_modules"

  activate :asset_hash
  activate :minify_css
  activate :minify_html, remove_input_attributes: false
  activate :minify_javascript
  activate :gzip

  activate :robots, rules:    [{ user_agent: '*', allow: %w(/) }], sitemap:  "#{@app.data.site.url}/sitemap.xml"

  activate :sitemap, hostname: @app.data.site.url

  set :relative_links, true
  activate :relative_assets
end

# activate :deploy do |deploy|
#   deploy.deploy_method  = :git
#   deploy.branch         = 'gh-pages'
#   deploy.build_before   = true
# end
