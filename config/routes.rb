Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'filter_candidates/:job_id', to: 'matching#filter_candidates'
      get 'filter_jobs/:working_hour_id', to: 'matching#filter_jobs_by_working_hour'
    end
  end
end
