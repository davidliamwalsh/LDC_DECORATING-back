class Admin::CareersItemsController < Admin::ApplicationController
  before_action :find_careers_item, only: [:edit, :update, :destroy]

  def new
    @careers_item = CareersItem.new
  end

  def edit
  end

  def index
    @careers_items = CareersItem.order(:title).page(params[:page])
  end

  def create
    @careers_item = CareersItem.new(careers_item_params)

    if @careers_item.save
      redirect_to admin_careers_items_path, status: :found, notice: "Careers Item successfully created!"
    else
      render :new 
    end
  end

  def update
    @careers_item.attributes = careers_item_params
    
    if @careers_item.save
      redirect_to admin_careers_items_path, notice: "Careers Item successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @careers_item.destroy

    redirect_to admin_careers_items_path, notice: "Careers Item successfully deleted!"
  end

  private

  def careers_item_params
    params.require(:careers_item).permit(:title, :job_description, :job_type, :experience, :location, :drivers_license, :language)
  end

  def find_careers_item
    @careers_item = CareersItem.friendly.find(params[:id])
  end

end