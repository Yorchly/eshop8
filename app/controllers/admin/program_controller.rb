class Admin::ProgramController < ApplicationController
  def new
    load_data
    @program = Program.new
    @page_title = 'Create new program'
  end

  def create
    @program = Program.new(program_params)
    if @program.save
      flash[:notice] = "Program #{@program.title} was succesfully created."
      redirect_to :action => 'index'
    else
      load_data
      @page_title = 'Create new program'
      render :action => 'new'
    end
  end

  def edit
    load_data
    @program = Program.find(params[:id])
    @page_title = 'Edit program'
  end

  def update
    @program = Program.find(params[:id])
    if @program.update_attributes(program_params)
      flash[:notice] = "Program #{@program.title} was succesfully updated."
      redirect_to :action => 'show', :id => @program
    else
      load_data
      @page_title = 'Edit program'
      render :action => 'edit'
    end
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy
    flash[:notice] = "Succesfully deleted program #{@program.title}."
    redirect_to :action => 'index'
  end

  def show
    @program = Program.find(params[:id])
    @page_title = program.title
  end

  def index
    sort_by = params[:sort_by]
    @programs = Program.order(sort_by).paginate(:page => params[:page], :per_page => 5)
    @page_title = 'Listing programs'
  end

  private

    def load_data
      @developers = Developer.all
      @suppliers = Supplier.all
    end

    def program_params
      params.require(:program).permit(:name, :type, :developer_id, :developed_at, { :supplier_ids => [] },
                                   :serial_number, :blurb, :price, :cover_image)
    end
end
