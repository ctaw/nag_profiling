class Admin::UsersController < AdminController
  
  before_action :look_ups, :only => [:edit, :new, :update]
  
  def index
    @users = User.select("id,first_name,middle_name,last_name,email").
    paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @user = User.new
  end

  def create
    puts "**************"
    @fam = params[:user][:family_id]

    if !@fam.present?
      #family_group = FamilyGroup.create(family_last_name: params[:user][:last_name], no_of_members: 1, name: params[:user][:first_name])
    else
      
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          family_group = FamilyGroup.find_by_id(params[:user][:family_id])
          updated_family_member = family_group.no_of_members + 1
          family_group.update(no_of_members: updated_family_member.to_i)

          format.js { render :create }
        else
          format.js { render :error }
        end
      end

    end
  end

  private

  def look_ups
    @civil_status = [['Single','0'],['Married','1'],['Widowed','2'],['Divorced','3']]
    @families = FamilyGroup.select("id, family_last_name, name").order("family_last_name ASC") 
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :middle_name, :last_name, :name_extension, 
      :age, :birthdate, :birthplace, :address, :civil_status, :occupation, :date_accepted_christ, 
      :date_baptized_in_water, :date_baptized_in_spirit, :family_id)
  end

end