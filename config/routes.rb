Rails.application.routes.draw do
  resource :cookies,
           path: "/about/cookies",
           path_names: { edit: "/" },
           only: %i[edit update create]

  get "pages/:page", to: "pages#show"
  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unprocessable_entity", via: :all
  get "/500", to: "errors#internal_server_error", via: :all
  get "/503", to: "errors#service_unavailable", via: :all

  #resources :submissions
  
  #resources :businesses

  # redirect no URL
  get  "" => redirect("/wizard/start")

  get "status" => redirect("status#status")
  
  # redirect only the wizard
  get  "/wizard" => redirect("/wizard/start")

  # Map URLs to Controllers and Actions (controller#action)

  get 'wizard' => 'wizard#start'
  get 'wizard/start' => 'wizard#start'
  get 'wizard/start_submit' => 'wizard#start_submit'

  get 'wizard/classify' => 'wizard#classify'
  post 'wizard/classify/submit' => 'wizard#classify_submit'

  get 'wizard/what_happened' => 'wizard#what_happened'
  post 'wizard/what_happened/submit' => 'wizard#what_happened_submit'

  get 'wizard/additional_information' => 'wizard#additional_information'
  post 'wizard/additional_information/submit' => 'wizard#additional_information_submit'

  get 'wizard/businesses' => 'wizard#businesses'
  post 'wizard/businesses/submit' => 'wizard#businesses_submit'

  get 'wizard/business/add' => 'wizard#business_add'
  post 'wizard/business/add/submit' => 'wizard#business_add_submit'

  get 'wizard/business/edit' => 'wizard#business_edit'
  post 'wizard/business/edit/submit' => 'wizard#business_edit_submit'

  get 'wizard/business/remove' => 'wizard#business_remove'

  get 'wizard/evidence' => 'wizard#evidence'
  post 'wizard/evidence/submit' => 'wizard#evidence_submit'
  patch 'wizard/evidence/upload' => 'wizard#evidence_upload'

  get 'wizard/evidence/remove' => 'wizard#evidence_remove'

  get 'wizard/nation' => 'wizard#nation'
  post 'wizard/nation/submit' => 'wizard#nation_submit'

  get 'wizard/contact' => 'wizard#contact'
  post 'wizard/contact/submit' => 'wizard#contact_submit'

  get 'wizard/related_reference_number' => 'wizard#related_reference_number'
  post 'wizard/related_reference_number/submit' => 'wizard#related_reference_number_submit'

  get 'wizard/related_investigation' => 'wizard#related_investigation'
  post 'wizard/related_investigation/submit' => 'wizard#related_investigation_submit'

  get 'wizard/cartels' => 'wizard#cartels'
  get 'wizard/whistleblowing' => 'wizard#whistleblowing'

  get 'wizard/review' => 'wizard#review'
  post 'wizard/review_submit' => 'wizard#review_submit'

  get 'wizard/information_use' => 'wizard#information_use'
  post 'wizard/information_use_submit' => 'wizard#information_use_submit'

  get 'wizard/summary' => 'wizard#summary'

  get 'wizard/pdf' => 'wizard#pdf'

  get 'wizard/print' => 'wizard#print'

  get 'wizard/error' => 'wizard#error'
  
  get "/404", to: "errors#not_found", via: :all

  #get "/resubmit/list", to: "resubmit#list", via: :all
  #get "/resubmit/view", to: "resubmit#view", via: :all
  #post "/resubmit/submit", to: "resubmit#submit", via: :all

  get "/view/submission", to: "view#submission", via: :all

end
