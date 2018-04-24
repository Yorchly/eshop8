class Admin::ProgramController < ApplicationController
  def new
    load_data
    @program = Program.new
    @page_title = 'Crear nuevo programa'
  end

  def create
    @program = Program.new(program_params)
    if @program.save
      flash[:notice] = "El programa #{@program.name} ha sido creado correctamente."
      redirect_to :action => 'index'
    else
      load_data
      @page_title = 'Crear nuevo programa'
      render :action => 'new'
    end
  end

  def edit
    load_data
    @program = Program.find(params[:id])
    @page_title = 'Editar programa'
  end

  def update
    @program = Program.find(params[:id])
    if @program.update_attributes(program_params)
      flash[:notice] = "El programa #{@program.name} ha sido actualizado correctamente."
      redirect_to :action => 'show', :id => @program
    else
      load_data
      @page_title = 'Editar programa'
      render :action => 'edit'
    end
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy
    flash[:notice] = "#{@program.name} eliminado correctamente."
    redirect_to :action => 'index'
  end

  def show
    @program = Program.find(params[:id])
    #@page_title = program.name
  end

  def index
    sort_by = params[:sort_by]
    @programs = Program.order(sort_by).paginate(:page => params[:page], :per_page => 5)
    @page_title = 'Lista de programas'
  end

  private

    def load_data
      @developers = Developer.all
      @suppliers = Supplier.all
    end

    def program_params
      params.require(:program).permit(:name, :kind, :developer_id, :developed_at, { :supplier_ids => [] },
                                   :serial_number, :blurb, :price, :cover_image)
    end
end
