class Form < AbstractModel
    has_and_belongs_to_many :tags
    has_one :norm, :foreign_key => :rule, :primary_key => :rule

    def self.morph_info(lexem)
        res=Form.joins("JOIN #{Stem.table_name} ON #{Stem.table_name}.rule  = #{Form.table_name}.rule").where('prefix||suffix = ?', lexem)
        	.select("#{Form.table_name}.*, #{Stem.table_name}.id as stem");
        res.each do |form|
        	form.stem = Stem.find_by_id(form.stem)
        end
    end

    def tags_humanize
    	self.tags.map(&:name).join(', ');
    end

end
