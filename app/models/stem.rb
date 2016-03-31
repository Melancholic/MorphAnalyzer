class Stem < AbstractModel
    self.table_name = 'stem';
    @lexem= nil;

    def self.morph_info(lexem)
        res=Stem.joins("JOIN form ON stem.rule  = form.rule").where('prefix||suffix = ?', lexem).select('*');
    end
    def self.morph_info_humanize(lexem)
        Stem.joins("JOIN form ON stem.rule  = form.rule").where('prefix||suffix = ?', lexem).select('*').map{|x| x.tags_humanize}
    end

    def lemma
        self.prefix+Norm.find_by(rule:  self.rule).suffix
    end
end
