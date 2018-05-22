class Admin::OrderController < Admin::AuthenticatedController
  def close
    order = Order.find(params[:id])
    order.close
    flash[:notice] = "El pedido ##{order.id} ha sido cerrado."
    redirect_to :action => 'index'
  end

  def show
    @order = Order.find(params[:id])
    @page_title = "Mostrando pedido ##{@order.id}"
  end

  def index
    @status = params[:id]
    if @status.blank?
      @status = 'all'
      @estado = '(todos)'
      conditions = nil
    else
      conditions = "status = '#{@status}'"
      @estado = 'abiertos' if @status == 'open'
      @estado = 'procesados' if @status == 'processed'
      @estado = 'cerrados' if @status == 'closed'
      @estado = 'fallidos' if @status == 'failed'
    end
    @orders = Order.where(conditions).paginate(:page => params[:page], :per_page => 10)
    @page_title = "Listando los pedidos #{@estado}"
  end
end
