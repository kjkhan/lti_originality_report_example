Rails.application.routes.draw do
  root 'pages#home'

  scope(controller: :registration) do
    post 'register', action: :register, as: :registration
  end

  scope(controller: :assignments) do
    post 'assignments/configure', action: :configure, as: :assignment_configuration
    post 'assignments/:lti_assignment_id/update', action: :update, as: :assignment_update
  end

  scope(controller: :submission) do
    post 'submission/index', action: :index
  end

  namespace :event do
    post :submission
  end

end
