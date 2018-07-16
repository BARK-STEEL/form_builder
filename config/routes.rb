Rails.application.routes.draw do
  resources :forms, :member => { :sort_fields => :post } do |forms|
    resources :submissions, :collection => { :thank_you => :get }
  end
  root :controller => :forms, :action => :index
end
