class AbstractModel < ActiveRecord::Base
    include TagHelper
    self.abstract_class = true

    def tags_humanize()
        self.try(:tag).split(/,| /).map{|x| MorphAnalyzer::TAGS[x] || x}.join(', ') if self.has_attribute?(:tag)
    end
end
