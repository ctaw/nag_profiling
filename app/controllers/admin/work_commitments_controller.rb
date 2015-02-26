class Admin::WorkCommitmentsController < AdminController

  before_action :look_ups, :only => [:edit, :update, :show, :destroy]
  
  def index
    @work_commitments = WorkCommitment.select("id,name,description").
    paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @work_commitment = WorkCommitment.new
  end

  def show
  end

  def edit
  end

  def update
    @work_commitment = WorkCommitment.find(params[:id])
    respond_to do |format|
      if @work_commitment.update(work_commitment_params)
        format.js { render :update }
      else
        format.html { render :edit }
        format.js { render :error }
      end
    end
  end

  def create
    @work_commitment = WorkCommitment.new(work_commitment_params)
    respond_to do |format|
        if @work_commitment.save
          format.js { render :create }
        else
          format.js { render :error }
        end
      end
  end

  def destroy
    @work_commitment.destroy
    redirect_to action: :index
  end

  private

  def look_ups
    @work_commitment = WorkCommitment.find(params[:id])
  end

  def work_commitment_params
    params.require(:work_commitment).permit(:name, :description)
  end
end