# coding: utf-8
class Admin::SessionsController < Admin::Base
  skip_before_filter :admin_login_required
  def create
    administrator = Administrator.authenticate(params[:email], params[:password])
    if administrator
      session[:administrator_id] = administrator.id
    else
      flash.alert = "メールアドレスとパスワードが一致しません"
    end
    redirect_to params[:from] || :root
  end

  def destroy
    flash.notice = "ログアウトしました"
    session.delete(:administrator_id)
    redirect_to :admin_root
  end
end
