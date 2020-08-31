module JobFilter
  extend ActiveSupport::Concern

  included do
    scope :select_all, -> { select('*') }

    scope :match_locations, lambda { |location_ids|
      select = sanitize_sql_for_conditions(
        [
          'CASE
           WHEN location_id IN (?) THEN 1
             ELSE 0
           END AS match_location',
          [location_ids].flatten
        ]
      )

      select(select)
    }

    scope :match_job_types, lambda { |job_type_ids|
      select = sanitize_sql_for_conditions(
        [
          'CASE
           WHEN job_type_id IN (?) THEN 1
           ELSE 0
           END AS match_job_type',
          [job_type_ids].flatten
        ]
      )

      select(select)
    }

    scope :match_working_hours, lambda { |starts_at, ends_at|
      select = sanitize_sql_for_conditions(
        [
          'CASE
           WHEN starts_at >= ? AND
                ends_at <= ? THEN 1
           ELSE 0
           END AS match_working_hour',
          starts_at, ends_at
        ]
      )

      select(select)
    }
  end
end
