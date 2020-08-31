class JobSerializer
  include FastJsonapi::ObjectSerializer

  set_type :job
  set_id :id

  attributes :title, :description, :starts_at, :ends_at, :job_type_id, :location_id
end
