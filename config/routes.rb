Rails.application.routes.draw do
  resources :guesses
  get 'guesses/new'
  post 'submit_answer', to: 'guesses#mastermind'
  
  root 'guesses#mastermind'
end
