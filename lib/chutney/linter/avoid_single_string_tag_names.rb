# frozen_string_literal: true

module Chutney
  # service class to lint for single character tags, such as @t

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
