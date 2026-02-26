module Chutney
  class AvoidSingleStringTagNames < Linter
    def lint
      scenarios do |feature, scenario|
        tags = tags_for(feature) + tags_for(scenario)
        next unless tags.any? { |tag| tag.length == 1 }
        add_issue(
          I18n.t('linters.avoid_single_string_tag_names'),
          feature
        )
      end
    end
  end
end

# 1st approach. We filter out the tags to only look for singular tags