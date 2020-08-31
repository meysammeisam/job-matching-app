module MatchingTool
  # MatchingTool::CandidatesFinder
  class CandidatesFinder < MatchingTool::Base
    option :job

    private

    def subject_model
      Candidate
    end

    def matched_results
      subject_model
        .select_all
        .match_locations(job.location_id)
        .match_working_hours(job.starts_at, job.ends_at)
        .match_job_types(job.job_type_id)
    end
  end
end
