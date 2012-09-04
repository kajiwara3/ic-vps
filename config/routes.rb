IcVps::Application.routes.draw do
  # deviseを使ったユーザー認証
  devise_for :partners

  # パートナーページ用リソース
  root to: "top#index", only: :index
  # VPS管理
  resources :vps_management

  resources :partners do
    resources :private_servers do
      member { put "stop", "start", "reboot" }
    end
  end

  resources :private_servers

  resource :partner

  # アドミンページ用リソース
  namespace :admin do
    # 管理者トップ
    root to: "top#index"
    # パートナーリソース
    resources :partners do
      collection { get "search" }
    end
    # アドミンリソース
    resources :administrators do
      collection { get "search" }
    end
    # お知らせリソース
    resources :notifications do
      collection { get "search" }
    end
    # ドメインテンプレート
    resources :domain_templates do
      collection { get "search" }
    end
    # セッションリソース
    resource :session, only: [:create, :destroy]
  end
end
