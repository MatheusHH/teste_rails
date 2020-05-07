class Company::EditPasswordController < ApplicationController
  before_action :authenticate_company_user!
  before_action :set_user

  def edit
  end

  def update 
  	respond_to do |format|
      if @company_user.update_with_password(company_user_params)
        format.html { redirect_to company_root_url, notice: 'Senha Atualizada com Sucesso' }
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
      params.require(:company_user).permit(:current_password, :password, :password_confirmation)
   end

end
