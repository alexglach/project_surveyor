Rails.application.routes.draw do

  root "surveys#index"

  resources :surveys do
    resources :multiple_choice_questions, shallow: true do 
      resources :options
    end
  end

  resources :surveys do
    resources :range_questions, shallow: true do
      resources :options
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
