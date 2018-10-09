module Jekyll
  # Responsible for generating the /browse_pages page, grabbing all of
  # the pages and parsing them for title and keywords
  #
  # The #generate method is called as part of the Jekyll generate process
  class BrowsePagesGenerator < Generator
    safe true

    attr_reader :site

    def generate(site)
      @site = site
      site.pages << browse_pages_page
    end

    private

      # Returns an instance of a PageWithoutAFile and sets the necessary layout
      # and page data for displaying the keyword index.
      # @return [Jekyll::PageWithoutAFile] the page for browsing pages
      def browse_pages_page
        PageWithoutAFile.new(site, site.source, '', 'browse_pages.html').tap do |page|
          page.data['layout'] = 'browse_pages'
          page.data['page_info_by_title'] = page_info_by_title
          page.data['page_info_by_keyword'] = page_info_by_keyword
        end
      end


      def page_info_by_title
        pages_with_titles.sort_by { |page| page.data['title'].downcase }.map do |page|
          data_from_page(page)
        end
      end



      # Compile a sorted list of keyword index entries. Each entry is a hash
      # that looks like this:
      #   {
      #     keyword: 'example',
      #     pages: [
      #       { title: 'First Page', link: 'first_page.html' },
      #       { title: 'Second Page', link: 'second_page.html' }
      #     ]
      #   }
      # @reuturn [Array<Hash>] a sorted array of hashes.
      def page_info_by_keyword
        page_data_grouped_by_keyword.sort_by do |e|
          # Sort by the keyword, case insensitive
          e[0].downcase
        end.map do |keyword, pages|
          # Map the sorted array entry back into a hash for easier access in
          # the template.
          { 'keyword' => keyword, 'pages' => pages }
        end
      end

      # Creates a hash where the keys are keywords and the values are lists
      # of hashes containing page data.
      # @return [Hash]
      def page_data_grouped_by_keyword
        {}.tap do |hash|
          pages_with_keywords.each do |page|
            Array(page.data['keywords']).each do |keyword|
              keyword = keyword.strip
              hash[keyword] ||= []
              hash[keyword] << data_from_page(page)
            end
          end
        end
      end

      # Get a hash of only necessary data from the given Page object.
      # @param [Jekyll::Page] page
      # @return [Hash]
      def data_from_page(page)
        {
          'link'  => page.permalink || page.url,
          'title' => page.data['title']
        }
      end

      # Select those page that have keywords defined.
      # @return [Array<Jekyll::Page>]
      def pages_with_keywords
        site.pages.select { |page| page.data['keywords'] }
      end

      # Select those page that have a title defined.
      # @return [Array<Jekyll::Page>]
      def pages_with_titles
        site.pages.select { |page| page.data['title'] }
      end
  end
end
