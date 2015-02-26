class Admin::MembersController < AdminController

  before_action :look_ups, :only => [:edit, :new, :update]
  
  def index
    @members = Member.select("id,first_name,middle_name,last_name,email").
    paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @member = Member.new

  end

  def show
    @member = Member.find(params[:id])
  end

  def create
    @fam = params[:member][:family_id]

    if !@fam.present?
      @member = Member.new(user_params)
      
      @family_group = FamilyGroup.create(family_last_name: params[:member][:last_name], no_of_members: 1, name: params[:member][:first_name])
      @member.family_id = @family_group.id

      if @member.save
        redirect_to "/admin/members/church_involvement?member_id=#{@member.id}"
      else
        redirect_to "/"
      end
    else
      @member = Member.new(user_params)

      family_group = FamilyGroup.find_by_id(params[:member][:family_id])
      updated_family_member = family_group.no_of_members + 1
      family_group.update(no_of_members: updated_family_member.to_i)

      if @member.save
        redirect_to "/admin/members/church_involvement?member_id=#{@member.id}"
      else
        redirect_to "/"
      end

    end
  end

  def church_involvement
    
  end

  def church
    involvement = Involvement.create(member_id: params[:member_id], date_joined: params[:date_joined], department_id: params[:department_id], work_commitment_id: params[:work_commitment_id])
  end

  private

  def look_ups
    @civil_status = [['Single','0'],['Married','1'],['Widowed','2'],['Divorced','3']]
    @families = FamilyGroup.select("id, family_last_name, name").order("family_last_name ASC") 
    @relationship_members = [['---','0'],['Father','1'],['Mather','2'],['Sister','3'],['Brother','4']]
    @departments = Department.select("id, name").order("name ASC")
    @positions = Position.select("id, name").order("name ASC")
    @status = [['Active','1'],['InActive','1']]
  end

  def user_params
    params.require(:member).permit(:email, :first_name, :middle_name, :last_name, :name_extension, 
      :age, :birthdate, :birthplace, :address, :civil_status, :occupation, :date_accepted_christ, 
      :date_baptized_in_water, :date_baptized_in_spirit, :family_id, :relationship_id, :position_id, :status)
  end

end