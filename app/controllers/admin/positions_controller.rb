class Admin::PositionsController < AdminController
  before_action :look_ups, :only => [:edit, :update, :show, :destroy]
  
  def index
    @positions = Position.select("id,name,description").
    paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @position = Position.new
  end

  def show
  end

  def edit
  end

  def update
    @position = Position.find(params[:id])
    respond_to do |format|
      if @position.update(position_params)
        format.js { render :update }
      else
        format.html { render :edit }
        format.js { render :error }
      end
    end
  end

  def create
    @position = Position.new(position_params)
    respond_to do |format|
        if @position.save
          format.js { render :create }
        else
          format.js { render :error }
        end
      end
  end

  def destroy
    @position.destroy
    redirect_to action: :index
  end

  private

  def look_ups
    @position = Position.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:name, :description)
  end
end