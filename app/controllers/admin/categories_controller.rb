class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
  	@categories = Category.all.page(params[:page]).per(4)
  end

  def show
  end

  def new
  	@category = Category.new
  end

  def edit
  end

  def create
  	@category = Category.new(category_params)
    @category.user = current_user
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_url, notice: t('flash.actions.create.notice(a)', model: @category.model_name.human) }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end 

  def update
  	respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_categories_url, notice: t('flash.actions.update.notice(a)', model: @category.model_name.human) }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_url, notice: t('flash.actions.destroy.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:image, :name, :tags, :visible, :user_id )
    end
end
