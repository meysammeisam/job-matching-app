module CandidateFilter
  extend ActiveSupport::Concern

  included do
    scope :select_all, -> { select('*') }

    scope :match_locations, lambda { |location_ids|
      select = sanitize_sql_for_conditions(
        [
          'CASE
           WHEN candidate_preferred_locations.district_id IN (?) THEN 1
             ELSE 0
           END AS match_location',
          [location_ids].flatten
        ]
      )

      left_joins(:candidate_preferred_locations).select(select)
    }

    scope :match_job_types, lambda { |job_type_ids|
      select = sanitize_sql_for_conditions(
        [
          'CASE
           WHEN candidate_preferred_job_types.job_type_id IN (?) THEN 1
           ELSE 0
           END AS match_job_type',
          [job_type_ids].flatten
        ]
      )

      left_joins(:candidate_preferred_job_types).select(select)
    }

    scope :match_working_hours, lambda { |starts_at, ends_at|
      select = sanitize_sql_for_conditions(
        [
          'CASE
           WHEN candidate_working_hours.starts_at <= ? AND
                candidate_working_hours.ends_at >= ? THEN 1
           ELSE 0
           END AS match_working_hour',
          starts_at, ends_at
        ]
      )

      left_joins(:working_hours).select(select)
    }
  end
end
