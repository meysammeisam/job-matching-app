module MatchingTool
  # MatchingTool::CandidatesFinder
  class CandidatesFinder < MatchingTool::Base
    option :job

    def call
      paginate sorted_matched_candidates
    end

    private

    def sorted_matched_candidates
      Candidate
        .select('
          *,
          (
            COALESCE(match_location, 0) +
            COALESCE(match_working_hour, 0) +
            COALESCE(match_job_type,0)
          ) as matching_rate')
        .from(matched_candidates)
        .order(matching_rate: :desc)
    end

    def matched_candidates
      Candidate
        .select_all
        .match_locations(job.location_id)
        .match_working_hours(job.starts_at, job.ends_at)
        .match_job_types(job.job_type_id)
    end
  end
end
