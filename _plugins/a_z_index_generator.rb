# A-Z Index Generator is a Jekyll plugin that generates a a-z.md file by
# traversing all of the available posts and pages adding an entry for each
# a-z index tag in the front matter.
#
# See readme file for documenation
#
# Updated to use config file for settings by Daniel Groves
# Site: http://danielgroves.net
#
# Author: Michael Levin
# Site: http://www.kinnetica.com
# Distributed Under A Creative Commons License
#   - http://creativecommons.org/licenses/by/3.0/
require 'jekyll/document'
require 'rexml/document'

module Jekyll
  class Jekyll::Document
    attr_accessor :name

    def path_to_source
      File.join(*[@name].compact)
    end
  end

  class Page
    attr_accessor :name

    def path_to_source
      File.join(*[@dir, @name].compact)
    end
  end

  # Recover from strange exception when starting server without --auto
  class AZIndexFile < StaticFile
    def write(_dest)
      true
    end
  end

  class AZIndexGenerator < Generator
    priority :lowest
    safe true

    # Config defaults
    A_Z_FILE_NAME = '/a-z.html'.freeze
    RELATIVE_PATH = ''.freeze
    INDEX_TITLE = true
    EXCLUDE = ['/atom.xml', '/feed.xml', '/feed/index.xml', '/a-z.html', '/a-z.md'].freeze
    INCLUDE_POSTS = ['/index.html'].freeze
    OUTPUT_TYPE = :html
    FRONT_MATTER_EXT = [].freeze

    # Goes through pages and posts and generates a-z.html file
    #
    # Returns nothing
    def generate(site)
      puts "Generating A-Z Index..."
      process_config(site)

      puts "   building the a-z index"
      idx = initialize_index
      # process_posts(site, idx)
      process_pages(site, idx)
      sort_index(idx)

      puts "   writing to file: #{@config['filename']}"
      write_index(site, idx)
    end

    def process_config(site)
      a_z_config = site.config['a_z'] || {}
      @config = {}
      @config['filename'] = valid_filename(a_z_config['filename'])
      @config['relative_path'] = a_z_config['relative_path'] || RELATIVE_PATH
      @config['destination_path'] = valid_destination(site, a_z_config['alternate_dest'])
      @config['output_type'] = determine_output_type
      @config['index_title'] = valid_boolean(a_z_config['index_title'])
      @config['exclude'] = a_z_config['exclude'] || EXCLUDE
      # @config['include_posts'] = a_z_config['include_posts'] || INCLUDE_POSTS
      @config['front_matter_ext'] = a_z_config['front_matter_ext'] || FRONT_MATTER_EXT
    end

    def initialize_index
      { a: [], b: [], c: [], d: [], e: [], f: [], g: [], h: [], i: [], j: [], k: [], l: [], m: [], n: [], o: [], p: [], q: [], r: [], s: [], t: [], u: [], v: [], w: [], x: [], y: [], z: [] }
    end

    # # Create url elements for all the posts and find the date of the latest one
    # #
    # # Returns last_modified_date of latest post
    # def process_posts(site, idx)
    #   last_modified_date = nil
    #   site.collections["posts"].docs.each do |post|
    #     if !excluded?(post.name)
    #       add_terms(site, idx, post)
    #     end
    #   end
    # end

    # Create url elements for all the normal pages and find the date of the
    # index to use with the pagination pages
    #
    # Returns last_modified_date of index page
    def process_pages(site, idx)
      site.pages.each do |page|
        unless excluded?(page.path_to_source)
          add_terms(idx, page) if File.exist?(page.path)
        end
      end
    end

    # Add all a-z terms and title to the index.
    def add_terms(idx, page_or_post)
      url = page_url(page_or_post)
      add_term(idx, page_or_post.data['title'], url) if index_title?
      page_or_post.data['a-z'].each { |term| add_term(idx, term, url) } if page_or_post.data.key? 'a-z'
    end

    # Add a term to the index.
    def add_term(idx, term, url)
      return unless term.is_a? String
      return unless url.is_a? String
      idx[term[0].downcase.to_sym] << [term, url]
    end

    # Get URL location of page or post
    #
    # Returns the url of the page or post
    def page_url(page_or_post)
      "#{@config['relative_path']}#{page_or_post.url}"
    end

    # Sort index alphabetically and remove duplicate entries
    def sort_index(idx)
      idx.values.each do |section|
        section.uniq!
        section.sort! do |x, y|
          if x[0] == y[0]
            x[1] <=> y[1]
          else
            x[0] <=> y[0]
          end
        end
      end
    end

    def write_index(site, idx)
      file = File.new(File.join(@config['destination_path'], @config['filename']), "w")
      # write_html(file, idx) if @config['output_type'] == :html
      # write_md(file, idx) if @config['output_type'] == :md
      write_md(file, idx)
      file.close
      site.static_files << Jekyll::AZIndexFile.new(site, site.dest, "/", @config['filename'])
    end

    def write_html(file, idx)
      file.write "Hello World"
      write_content(file, idx)
    end

    def write_md(file, idx)
      file.puts "---"
      file.puts "title: 'A-Z Index'"
      file.puts "permalink: a-z.html"
      file.puts "folder: a-z.md"
      @config['front_matter_ext'].each { |fm| file.puts fm }
      file.puts "---"
      write_content(file, idx)
    end

    def write_content(file, idx)
      file.puts "<div id='atoz'>"
      write_toc(file)
      write_terms(file, idx)
      file.puts "</div>"
    end

    def write_toc(file)
      file.puts "  <div class='atoz_tabs'>"
      file.puts "    <a class='atoz_tab' href='#a'> A </a>"
      file.puts "    <a class='atoz_tab' href='#b'> B </a>"
      file.puts "    <a class='atoz_tab' href='#c'> C </a>"
      file.puts "    <a class='atoz_tab' href='#d'> D </a>"
      file.puts "    <a class='atoz_tab' href='#e'> E </a>"
      file.puts "    <a class='atoz_tab' href='#f'> F </a>"
      file.puts "    <a class='atoz_tab' href='#g'> G </a>"
      file.puts "    <a class='atoz_tab' href='#h'> H </a>"
      file.puts "    <a class='atoz_tab' href='#i'> I </a>"
      file.puts "    <a class='atoz_tab' href='#j'> J </a>"
      file.puts "    <a class='atoz_tab' href='#k'> K </a>"
      file.puts "    <a class='atoz_tab' href='#l'> L </a>"
      file.puts "    <a class='atoz_tab' href='#m'> M </a>"
      file.puts "    <a class='atoz_tab' href='#n'> N </a>"
      file.puts "    <a class='atoz_tab' href='#o'> O </a>"
      file.puts "    <a class='atoz_tab' href='#p'> P </a>"
      file.puts "    <a class='atoz_tab' href='#q'> Q </a>"
      file.puts "    <a class='atoz_tab' href='#r'> R </a>"
      file.puts "    <a class='atoz_tab' href='#s'> S </a>"
      file.puts "    <a class='atoz_tab' href='#t'> T </a>"
      file.puts "    <a class='atoz_tab' href='#u'> U </a>"
      file.puts "    <a class='atoz_tab' href='#v'> V </a>"
      file.puts "    <a class='atoz_tab' href='#w'> W </a>"
      file.puts "    <a class='atoz_tab' href='#x'> X </a>"
      file.puts "    <a class='atoz_tab' href='#y'> Y </a>"
      file.puts "    <a class='atoz_tab' href='#z'> Z </a>"
      file.puts "  </div>"
    end

    def write_terms(file, idx)
      idx.each do |alpha, terms|
        file.puts "  <div class='atoz_section'>"
        file.puts "    <a class='atoz_anchor' name='#{alpha.to_s.downcase}'>&nbsp;</a>"
        file.puts "    <span class='atoz_section_label'>#{alpha.to_s.upcase}</span>"

        file.puts "    <div class='atoz_terms'>"
        terms.each { |term_url| write_term(file, term_url) }
        file.puts "    </div>"

        file.puts "  </div>"
      end
    end

    def write_term(file, term_url)
      term = term_url[0]
      url = term_url[1]
      file.puts "      <a class='atoz_term' href='#{url}'>#{term}</a>"
      file.puts "      <br>"
    end

    # Is the page or post listed as something we want to exclude?
    #
    # Returns boolean
    def excluded?(name)
      @config['exclude'].include? name
    end

    def posts_included?(name)
      @config['include_posts'].include? name
    end

    def index_title?
      @config['index_title']
    end

    def valid_filename(configured_value)
      return A_Z_FILE_NAME unless configured_value
      return A_Z_FILE_NAME unless configured_value.is_a? String
      return A_Z_FILE_NAME if configured_value.empty?
      configured_value
    end

    def determine_output_type
      fn = @config['filename']
      dot = fn.rindex('.')
      ext = fn[dot + 1..fn.size] if dot && dot + 1 < fn.size
      return OUTPUT_TYPE unless ext
      return OUTPUT_TYPE if ext.empty?
      return :html if ext.casecmp('html').zero?
      return :md if ext.casecmp('md').zero?
      OUTPUT_TYPE
    end

    def valid_boolean(configured_value)
      return INDEX_TITLE unless configured_value
      return configured_value if configured_value.is_a? TrueClass
      return configured_value if configured_value.is_a? FalseClass
      INDEX_TITLE
    end

    def valid_destination(site, configured_value)
      path = site.dest
      path = "#{site.source}/#{configured_value}" if configured_value.is_a? String
      Dir.mkdir(path) unless Dir.exist?(path)
      path
    end
  end
end
