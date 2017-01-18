require 'uri'

module Jekyll
  module DocFilters

    def documentation_list(site, page)
      pages = site['pages'].select { |p|
        p.data['docs'] && p.data['title']
      }.sort_by { |p| p.data['docs'] }

      list =  ['<ol>']
      list << pages.map { |p|
        active = (p.url == page['url']) || (page.has_key?('next') && File.join(p.dir, p.basename) == '/index')
        navigation_list_item(File.join(site['url'], p.url), p.data['title'], active)
      }
      list << ['</ol>']

      list.join("\n")
    end
  end
end

Liquid::Template.register_filter(Jekyll::DocFilters)