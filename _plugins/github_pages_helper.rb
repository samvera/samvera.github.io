class GithubPagesHelper
  attr_reader :site
  def initialize(site)
    @site = site
  end

  def save_generated_files
    if env_var_set?
      site.config.fetch('github_pages_save_generated_files', []).each do |relative_path|
        FileUtils.cp generated_file_path(relative_path), source_file_path(relative_path)
      end
    end
  end

  def remove_generated_files
    if env_var_set?
      site.config.fetch('github_pages_save_generated_files', []).each do |relative_path|
        FileUtils.rm source_file_path(relative_path) if File.exists? source_file_path(relative_path)
      end
    end
  end

  private

    def env_var_set?
      ['1', 'true'].include? ENV.fetch('SAVE_GENERATED_FILES', '').to_s.downcase
    end

    def generated_file_path(relative_path)
      File.join(site.dest, relative_path)
    end

    def source_file_path(relative_path)
      File.join(site.source, relative_path)
    end
end

Jekyll::Hooks.register :site, :after_init do |site, payload|
  GithubPagesHelper.new(site).remove_generated_files
end

Jekyll::Hooks.register :site, :post_write do |site|
  GithubPagesHelper.new(site).save_generated_files
end
