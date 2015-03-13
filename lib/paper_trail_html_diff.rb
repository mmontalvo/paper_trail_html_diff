require 'action_view'
require 'paper_trail_html_diff/view_helpers'
require 'paper_trail_html_diff/version'

module PaperTrailHtmlDiff

  class PaperTrailFieldError < Exception; end

  # @paper_trail_attribute = :changeset
  # # @html_tag              = :div
  # # @diff_strings          = false
  # @separators            = [' from ', ' to ']
  # @excluded_fields       = %w(created_at updated_at token password)
  # @css_framework         = :bootstrap

  def self.config
    @config ||= PaperTrailHtmlDiff::Config.new
  end

  def self.paper_trail_attribute=(value)
    PaperTrailHtmlDiff.config.paper_trail_attribute = value
  end

  def self.paper_trail_attribute
    PaperTrailHtmlDiff.config.paper_trail_attribute
  end

  def self.separators=(value)
    PaperTrailHtmlDiff.config.separators = value
  end

  def self.separators
    PaperTrailHtmlDiff.config.separators
  end

  def self.excluded_fields=(value)
    PaperTrailHtmlDiff.config.excluded_fields = value
  end

  def self.excluded_fields
    PaperTrailHtmlDiff.config.excluded_fields
  end

  def self.css_framework=(value)
    PaperTrailHtmlDiff.config.css_framework = value
  end

  def self.css_framework
    PaperTrailHtmlDiff.config.css_framework
  end

end