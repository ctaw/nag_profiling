class Admin::MinistriesController < AdminController
  def index
    @ministries = Department.select("id, name").order("name ASC").paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @ministry = Department.find(params[:id])
    @involvements = Involvement.select("member_id").where(:department_id => params[:id])
    puts ">>>>>>>>>>>>>>>>"
    #user.comments.find_all_by_id(potentially_nonexistent_ids)

    @ids = []
    @involvements.each do |involvement|
      @ids << involvement.member_id
    end

    @members = Member.where('id in (?)',@ids)
    puts ">>>>>>>>"
    puts @members.inspect

  end
end
