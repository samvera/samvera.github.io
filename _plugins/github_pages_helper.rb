class GithubPagesHelper
  attr_reader :site
  def initialize(site)
    @site = site
  end

  def save_generated_files
    site.config.fetch('github_pages_save_generated_files', []).each do |relative_path|
      if changed?(relative_path)
        FileUtils.cp generated_file_path(relative_path), source_file_path(relative_path)
      end
    end
  end

  private

    def changed?(relative_path)
      generated_file_contents(relative_path) != source_file_contents(relative_path)
    end

    def generated_file_contents(relative_path)
      File.read generated_file_path(relative_path) if File.exists? generated_file_path(relative_path)
    end

    def source_file_contents(relative_path)
      File.read source_file_path(relative_path) if File.exists? source_file_path(relative_path)
    end

    def generated_file_path(relative_path)
      File.join(site.dest, relative_path)
    end

    def source_file_path(relative_path)
      File.join(site.source, relative_path)
    end
end

Jekyll::Hooks.register :site, :post_write do |site|
  GithubPagesHelper.new(site).save_generated_files
end
