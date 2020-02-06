class Admin::TestimonialsController < Admin::ApplicationController
  before_action :find_testimonial, only: [:show, :edit, :update, :destroy]

  def new
    @testimonial = Testimonial.new
  end

  def show
  end

  def edit
  end

  def index
    @testimonials = Testimonial.order(:title).page(params[:page])
  end

  def create
    @testimonial = Testimonial.new(testimonial_params)
    @testimonial.image.attach(testimonial_params[:image])

    if @testimonial.save
      redirect_to admin_testimonials_path, status: :found, notice: "Testimonial successfully created!"
    else
      render :new 
    end
  end

  def update
    @testimonial.attributes = testimonial_params
    
    if @testimonial.save
      redirect_to admin_testimonials_path, notice: "Testimonial successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @testimonial.destroy

    redirect_to admin_testimonials_path, notice: "Testimonial successfully deleted!"
  end

  private

  def testimonial_params
    params.require(:testimonial).permit(:title, :body, :image)
  end

  def find_testimonial
    @testimonial = Testimonial.friendly.find(params[:id])
  end

end