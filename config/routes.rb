IcVps::Application.routes.draw do
  # deviseを使ったユーザー認証
  devise_for :partners

  ###############################################
  # パートナーページ用リソース
  ###############################################
  root to: "top#index", only: :index
  # VPS管理
  resources :vps_management

  resources :partners do
    resources :private_servers do
      member { put "stop", "start", "reboot" }
    end
  end
  # プライベートサーバー
  resources :private_servers
  # パートナー（アカウントサービス）
  resource :partner
  # お知らせ
  resources :notifications, only: [:index, :show]
  # サポートページ
  resource :user_support
  # パートナー用FAQページ
  resources :faqs, only: [:index, :show, :search] do
    collection do
      get "search"
    end
  end
  # パートナー用FAQのカテゴリー別ページ
  resources :faq_categories, only: [:index, :show] do
    resources :faqs, only: [:index, :show]
  end

  ###############################################
  # アドミンページ用リソース
  ###############################################
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
    # FAQカテゴリー
    resources :faq_categories
    # FAQ
    resources :faqs do
      collection { get "search" }
    end
    # UserSupport
    resource :user_support
  end
end
