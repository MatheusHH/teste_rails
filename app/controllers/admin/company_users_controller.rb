class Admin::CompanyUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_company
  before_action :set_company_user, only: [:show, :edit, :update, :destroy]

  def index
  	@company_users = @company.company_users
  end

  def new
  	@company_user = @company.company_users.build
  end

  def show
  end

  def edit
  end

  def create
  	@company_user = @company.company_users.build(company_user_params)

    respond_to do |format|
      if @company_user.save  
        format.html { redirect_to admin_company_path(@company), notice: 'Usuário criado com sucesso.' }
        format.json { render :show, status: :created, location: @company_user }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @company_user.errors, status: :unprocessable_entity }
        format.js {}
      end
    end 
  end

  def update
  	respond_to do |format|
      if @company_user.update(company_user_params)
        format.html { redirect_to admin_company_path(@company), notice: 'Usuário atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @company_user }
        format.js {}
      else
        format.html { render :edit }
        format.json { render json: @company_user.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  def destroy
  	@company_user.destroy
     respond_to do |format|
      format.html { redirect_to admin_company_path(@company), notice: 'Usuário deletado com sucesso.' }
      format.json { head :no_content }
      format.js {}
    end
  end

  private
    def get_company
      @company = Company.find(params[:company_id])
    end

    def set_company_user
      @company_user = @company.company_users.find(params[:id])
    end

    def company_user_params
      params.require(:company_user).permit(:name, :role, :email, :password, :password_confirmation, :request_change_password, :company_id)
    end
end
