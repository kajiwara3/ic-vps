class SessionsController < Devise::SessionsController
  before_filter :record, only: ['update', 'create', 'destroy']
end