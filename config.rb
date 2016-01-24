###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page "robots.txt", :layout => false
page "humans.txt", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Livereload
#activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

set :markdown_engine, :maruku

activate :syntax

activate :i18n, mount_at_root: :he

activate :livereload

helpers do 
  def screenshot url, cls=""
    link_to "/images/#{url}", {data: {lightbox: 'screenshot'}, class: 'screenshot'} do
      image_tag url, class: cls
    end
  end

  def gallery_photo url, cls=""
    link_to "/images/#{url}", {data: {lightbox: 'gallery'}, class: cls} do
      image_tag url.gsub('.', '_tn.')
    end
  end

  def locale_root
    I18n.locale == :en ? '/en' : '/'
  end

  def localized_base(locale=nil)
    locale = I18n.locale if locale.nil?
    locale == :he ? '/' : "/#{locale}/"    
  end

  def localized_url(page, locale=nil)
    "#{localized_base(locale)}#{page}"
  end

  def guide_url(guide, locale=nil)
    localized_url("guides/#{guide}", locale)
  end

  def guide_step_url(guide, step, locale=nil)
    "#{guide_url(guide, locale)}/#{step}.html"
  end

  def guide_part_url(guide, step, part, locale=nil)
    if (step.nil? or step.empty?) and (part.nil? or part.empty?)
      guide_url(guide, locale)
    elsif part.nil? or part.empty?
      guide_step_url(guide, step, locale)
    else
      "#{guide_url(guide, locale)}/#{step}/#{part}.html"
    end
  end

  def current_guide_url(locale=nil)
    guide_part_url(data.page.guide, data.page.step, data.page.part, locale)
  end

  def external_guide_url(guide)
    if I18n.locale == :en
      "http://guides.railsgirls.com/#{guide}/"
    else
      "http://guides.railsgirls.co.il/#{guide}/"
    end
  end
end

page "*", layout: :site_layout

page "guides/*", layout: :guide
page "en/guides/*", layout: :guide


# Build-specific configuration
configure :build do

  activate :i18n, langs: [:he, :en]

  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end