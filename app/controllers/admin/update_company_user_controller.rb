class Admin::UpdateCompanyUserController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def edit
  end

  def update 
  	respond_to do |format|
      if @company_user.update(company_user_params)
        format.html { redirect_to admin_company_path(@company_user.company_id), notice: 'Usuário Atualizado com Sucesso' }
        format.json { render :show, status: :ok, location: @company }
        bypass_sign_in @company_user, scope: :company_user
      else
        format.html { render :edit }
        format.json { render json: @company_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

   def set_user
   	 @company_user = CompanyUser.find(params[:id])
   end

   def company_user_params
      params.require(:company_user).permit(:name, :email, :role, :password, :password_confirmation)
   end

end
