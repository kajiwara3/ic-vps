# coding: utf-8
class PartnersController < ApplicationController
  def show
    @partner = current_partner
  end

  def edit
    @partner = current_partner
  end

  def update
    @partner = current_partner
    @partner.assign_attributes(params[:partner])

    if @partner.save
      redirect_to "/partner", notice: "ご登録情報を更新しました"
    else
      render "edit"
    end
  end
end
