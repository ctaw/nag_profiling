class Admin::DepartmentsController < AdminController

  before_action :look_ups, :only => [:edit, :update, :show, :destroy]
  
  def index
    @departments = Department.select("id,name,description").
    paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @department = Department.new
  end

  def show
  end

  def edit
  end

  def update
    @department = Department.find(params[:id])
    respond_to do |format|
      if @department.update(deparment_params)
        format.js { render :update }
      else
        format.html { render :edit }
        format.js { render :error }
      end
    end
  end

  def create
    @department = Department.new(deparment_params)
    respond_to do |format|
        if @department.save
          format.js { render :create }
        else
          format.js { render :error }
        end
      end
  end

  def destroy
    @department.destroy
    redirect_to action: :index
  end

  private

  def look_ups
    @department = Department.find(params[:id])
  end

  def deparment_params
    params.require(:department).permit(:name, :description)
  end
end