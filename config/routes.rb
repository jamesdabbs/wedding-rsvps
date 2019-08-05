Rails.application.routes.draw do
  root 'welcome#index'

  resource :rsvp, only: [:create]
end
