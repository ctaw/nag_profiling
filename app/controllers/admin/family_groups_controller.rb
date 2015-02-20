class Admin::FamilyGroupsController < AdminController
  
  before_action :set_family_id, :only=> [:show, :edit, :update, :destroy]
  before_action :look_ups, :only => [:edit, :new, :update]
  
  def index
    @family_groups = FamilyGroup.all.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @family_group = FamilyGroup.new
  end

  def create
    @family_group = FamilyGroup.new(family_group_params)

    @family_group.no_of_members = 1 # if new
    
    respond_to do |format|
      if @family_group.save
        format.js { render :create }
      else
        format.js { render :error }
      end
    end
  end

  def show
  end

  private

  def look_ups
    @civil_status = [['YES','0'],['NO','1']]
  end

  def family_group_params
    params.require(:family_group).permit(:family_last_name, :no_of_members)
  end

  def set_family_id
    @family_group = FamilyGroup.find(params[:id])
  end

end