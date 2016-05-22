class StaticPagesController < ApplicationController
    def index

    end

    def lexem_analyze
        @lexem=params[:lexem]
        return @error= "Лексема не может быть пустой строкой!" if @lexem.empty?
        return @error= "Лексема должна содержать только кириллицу!" unless @lexem.match(/^[а-я]+$/)
        unless(@error)
            @result=Form.morph_info(@lexem)
            return @error= "Слово не найдено" if(@result.empty?)
        end
    end

    def sentence_lexem_analyze
        @sentence = params[:sentence].mb_chars
        #return @error= "Лексема не может быть пустой строкой!" if @lexem.empty?
        #return @error= "Лексема должна содержать только кириллицу!" unless @lexem.match(/^[а-я]+$/)
        #unless(@error)
            @lexems= @sentence.downcase!.split(/ |\,|\./).delete_if{|x| x.empty?}
            logger.info(@lexems)
            @results = @lexems.map do |x|
                Form.morph_info(x)
            end
            logger.info(@results)
            return @results
        #end
    end

    def find_references
        @sentence = params[:sentence].mb_chars
        @lexems= @sentence.downcase!.split(/ |\,|\./).delete_if{|x| x.empty?}
        @results = @lexems.map do |x|
            Form.morph_info(x.to_s).map{|x| x.tags[0]}.uniq[0].name;
        end
    end
end
