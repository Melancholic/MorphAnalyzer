class StaticPagesController < ApplicationController
    def index

    end

    def lexem_analyze
        @lexem=params[:lexem]
        return @error= "Лексема не может быть пустой строкой!" if @lexem.empty?
        return @error= "Лексема должна содержать только кириллицу!" unless @lexem.match(/^[а-я]+$/)
        unless(@error)
            @result=Stem.morph_info(@lexem)
            return @error= "Слово не найдено" if(@result.empty?)
        end
    end
end
