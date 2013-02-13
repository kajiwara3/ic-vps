IcVps::Application.routes.draw do
  ###############################################
  # パートナーページ用リソース
  ###############################################
  # TOP
  root to: "top#index", only: :index
  # deviseを使ったユーザー認証
  devise_for :partners
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
  resource :partner do

  end
  # お問い合わせ
  resources :contacts, only: [:index, :show, :new, :create]

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
  # staticページ
  get "/page/:action" => "pages#:action"

  ###############################################
  # アドミンページ用リソース
  ###############################################
  namespace :admin do
    # 管理者トップ
    root to: "top#index"
    # Devise
    devise_for :administrators
    # パートナーリソース
    resources :partners do
      collection { get "search" }
      # プライベートサーバー
      resources :private_servers
    end
    # プライベートサーバー
    resources :private_servers
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
    # FAQカテゴリー
    resources :faq_categories
    # FAQ
    resources :faqs do
      collection { get "search" }
    end
    # UserSupport
    resource :user_support

    resources :contacts do
      collection { get "search"}
    end
    # ログ管理
    resources :partner_operation_logs, only: [:index]
  end
end
