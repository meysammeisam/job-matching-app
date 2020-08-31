class CandidateSerializer
  include FastJsonapi::ObjectSerializer

  set_type :candidate
  set_id :id

  attributes :first_name, :last_name, :email
end
