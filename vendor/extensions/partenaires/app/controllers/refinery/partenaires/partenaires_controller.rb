module Refinery
  module Partenaires
    class PartenairesController < ::ApplicationController

      before_filter :find_all_partenaires
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @partenaire in the line below:
        present(@page)
      end

      def show
        @partenaire = Partenaire.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @partenaire in the line below:
        present(@page)
      end

    protected

      def find_all_partenaires
        @partenaires = Partenaire.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/partenaires").first
      end

    end
  end
end
