class Admin::DeveloperController < ApplicationController
 def new
    @developer = Developer.new
    @page_title = 'Create new developer'
  end

  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      flash[:notice] = "developer #{@developer.name} was succesfully created."
      redirect_to :action => 'index'
    else
      @page_title = 'Create new developer'
      render :action => 'new'
    end
  end

  def edit
    @developer = Developer.find(params[:id])
    @page_title = 'Edit developer'
  end

  def update
    @developer = Developer.find(params[:id])
    if @developer.update_attributes(developer_params)
       flash[:notice] = "developer #{@developer.name} was succesfully updated."
       redirect_to :action => 'show', :id => @developer
    else
       @page_title = 'Edit developer'
       render :action => 'edit'
    end
  end

  def destroy
    @developer = Developer.find(params[:id])
    @developer.destroy
    flash[:notice] = "Succesfully deleted developer #{@developer.name}."
    redirect_to :action => 'index'
  end

  def show
    @developer = Developer.find(params[:id])
    @page_title = @developer.name
  end

  def index
    @developers = Developer.all
    @page_title = 'Mostrando desarrolladores'
  end

  private
    def developer_params
      params.require(:developer).permit(:name)
    end
end
