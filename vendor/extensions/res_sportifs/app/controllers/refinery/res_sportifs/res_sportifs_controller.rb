module Refinery
  module ResSportifs
    class ResSportifsController < ::ApplicationController

      before_filter :find_all_res_sportifs
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @res_sportif in the line below:
        present(@page)
      end

      def show
        @res_sportif = ResSportif.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @res_sportif in the line below:
        present(@page)
      end

    protected

      def find_all_res_sportifs
        @res_sportifs = ResSportif.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/res_sportifs").first
      end

    end
  end
end
