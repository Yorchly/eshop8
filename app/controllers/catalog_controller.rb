class CatalogController < ApplicationController
  #before_filter :initialize_cart, :except => :show
  #before_filter :require_no_user

  def show
    @program = Program.find(params[:id])
    @page_title = @program.name
  end

  def index
    @programs = Program.order("programs.id desc").includes(:developer, :suppliers).paginate(:page => params[:page], :per_page => 5)
    @page_title = 'Catálogo'
  end

  def latest
    @programs = Program.latest 5 # invoques "latest" method to get the five latest programs
    @page_title = 'Últimos programas'
  end
end
