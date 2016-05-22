class Stem < AbstractModel

    @lexem= nil;
    has_many :forms, :foreign_key => :rule, :primary_key => :rule
    has_one :norm, :foreign_key => :rule, :primary_key => :rule

    def lemma
        self.prefix + self.norm.suffix
    end
end
