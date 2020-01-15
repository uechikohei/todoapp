class HomeController < ApplicationController

    def trash_em
        @trash_em = List.where(:completed => true).destroy_all
        redirect_to lists_url, notice: '実行済みのtodoリストは、全て削除されました'
    end

    def trash_em_all
        @trash_em_all = List.all.destroy_all
        redirect_to lists_url, notice: 'todoリストは全て削除されました'
    end

end