class Admin::DecoratorsController < Admin::ApplicationController
  before_action :find_decorator, only: [:edit, :update, :destroy]

  def new
    @decorator = Decorator.new
  end

  def edit
  end

  def index
    @decorators = Decorator.order(:title).page(params[:page])
  end

  def create
    @decorator = Decorator.new(decorator_params)
    @decorator.image.attach(decorator_params[:image])

    if @decorator.save
      redirect_to admin_decorators_path, status: :found, notice: "decorator successfully created!"
    else
      render :new 
    end
  end

  def update
    @decorator.attributes = decorator_params
    
    if @decorator.save
      redirect_to admin_decorators_path, notice: "decorator successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @decorator.destroy

    redirect_to admin_decorators_path, notice: "decorator successfully deleted!"
  end

  private

  def decorator_params
    params.require(:decorator).permit(:title, :subtitle, :body, :image, :email, :linkedin)
  end

  def find_decorator
    @decorator = Decorator.friendly.find(params[:id])
  end

end