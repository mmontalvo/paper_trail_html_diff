module PaperTrailHtmlDiff

  class Config

    attr_accessor :paper_trail_attribute,
                  # :html_tag,
                  # :diff_strings,
                  :separators,
                  :excluded_fields,
                  :css_framework

    def initialize
      @paper_trail_attribute = :changeset
      # @html_tag              = :div
      # @diff_strings          = false
      @separators            = [' from ', ' to ']
      @excluded_fields       = %w(created_at updated_at token password)
      @css_framework         = :bootstrap
    end

  end

end