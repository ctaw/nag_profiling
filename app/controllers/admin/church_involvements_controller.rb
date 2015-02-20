class Admin::ChurchInvolvementsController < AdminController
  
  def index
  end

  def new
    @church_involvement = ChurchInvolvement.new
  end

  def create
    @church_involvement = ChurchInvolvement.new(church_involvement_params)
    respond_to do |format|
      if @church_involvement.save
        format.html { 
          flash[:notice] = ''
          redirect_to ""
        }
      else
        format.html { render :action => "new" }
      end
    end
  end

  private

  def church_involvement_params
    
  end

end