class Admin::DeveloperController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  def index
    @developers = Developer.all
    @page_title = 'Mostrando desarrolladores'
  end
end
