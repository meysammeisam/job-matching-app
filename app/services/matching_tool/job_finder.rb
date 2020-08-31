module MatchingTool
  # MatchingTool::JobFinder
  class JobFinder < MatchingTool::Base
    option :candidate_working_hour

    private

    def candidate
      @candidate = candidate_working_hour.candidate
    end

    def subject_model
      Job
    end

    def matched_results
      subject_model
        .select_all
        .match_locations(location_ids)
        .match_working_hours(*working_hours)
        .match_job_types(job_type_ids)
    end

    def working_hours
      [candidate_working_hour.starts_at, candidate_working_hour.ends_at]
    end

    def location_ids
      candidate.preferred_locations.ids
    end

    def job_type_ids
      candidate.preferred_job_types.ids
    end
  end
end
