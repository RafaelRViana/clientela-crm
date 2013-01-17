module WillPaginate
  class RemoteLinkRenderer < ViewHelpers::LinkRenderer
    protected
    def page_link(page, text, attributes = {})
      @template.link_to text, url_for(page), attributes.merge(:remote => true)
    end
  end
end