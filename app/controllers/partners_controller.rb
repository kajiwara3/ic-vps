# coding: utf-8
class PartnersController < ApplicationController
  before_filter :authenticate_partner!
  before_filter :record, only: ['update', 'create', 'destroy']

  def show
    @partner = current_partner
  end

  def edit
    @partner = current_partner
  end

  def update
    @partner = current_partner
    delete_unchange_password_params
    @partner.assign_attributes(params[:partner])

    if @partner.save
      redirect_to "/partner", notice: "ご登録情報を更新しました"
    else
      render "edit"
    end
  end

  private
  def delete_unchange_password_params
    if params[:partner][:password].blank? &&
       params[:partner][:password_confirmation].blank?
       params[:partner].delete :password
       params[:partner].delete :password_confirmation
    end
  end
end
