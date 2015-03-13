require 'paper_trail_html_diff/config.rb'

module PaperTrailHtmlDiff

  module ViewHelpers

    def render_version(version)
      version_changes = discover_field(version)
      build_html(version_changes)
    end

    def build_html(object)
      return '<i>No changes!</i>'.html_safe if object.keys.empty?
      list_excluded_fields = clean_excluded_fields(object.keys)
      return '<i>All changes filtered</i>'.html_safe if list_excluded_fields.empty?
      list_excluded_fields.inject("") do |acum, key|
        left_diff  = diff_format(PaperTrailHtmlDiff.separators.first, object[key].first)
        right_diff = diff_format(PaperTrailHtmlDiff.separators.last, object[key].last)
        acum += '<div class="version_item">' + key.humanize + left_diff + right_diff + '</div>'
        acum
      end.html_safe
    end

    def clean_excluded_fields(object_keys)
      object_keys.delete_if{|key| PaperTrailHtmlDiff.excluded_fields.any?{|excluded_field| key.match excluded_field } }
    end

    def diff_format(separator, object)
      separator + discover_type(object)
    end

    def bootstrap_label_true
      '<span class="label label-primary">True</span>'
    end

    def bootstrap_label_false
      '<span class="label label-default">False</span>'
    end

    def foundation_label_true
      '<span class="label">True</span>'
    end

    def foundation_label_false
      '<span class="secondary label">False</span>'
    end

    def discover_type(version_value)
      case version_value
        when NilClass              then ' - '
        when Time, Date, DateTime  then I18n.l(version_value, format: :default)
        when TrueClass             then send(PaperTrailHtmlDiff.css_framework.to_s + '_label_true')
        when FalseClass            then send(PaperTrailHtmlDiff.css_framework.to_s + '_label_false')
        else version_value.to_s
      end
    end

    def discover_field(object)
      raise(PaperTrailFieldError, 'PaperTrail object does not respond to either changeset / object') unless object.respond_to?(PaperTrailHtmlDiff.paper_trail_attribute)
      load_attribute(object, PaperTrailHtmlDiff.paper_trail_attribute)
    end

    def load_attribute(object, config_attribute)
      if config_attribute.to_sym == :changeset
        object.send(config_attribute)
      else
        YAML.load(object.send(config_attribute).to_yaml)
      end
    end

  end

  ActionView::Base.class_eval { include ViewHelpers }

end