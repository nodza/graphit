Rails.application.routes.draw do
  root 'statistics#index'

  resources :charts, only: [] do
    collection do
      get 'athletes_by_age'
      get 'athletes_by_country'
      get 'results_by_country'
      get 'competitions_by_year'
      get 'competitions_by_month'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
