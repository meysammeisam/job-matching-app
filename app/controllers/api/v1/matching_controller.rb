module Api
  module V1
    class MatchingController < ApplicationController
      def filter_candidates
        job = Job.find params[:job_id]
        candidates = MatchingTool::CandidatesFinder.new(job: job).call

        render json: CandidateSerializer.new(candidates).serialized_json
      end

      def filter_jobs_by_working_hour
        working_hour = CandidateWorkingHour.find params[:working_hour_id]
        jobs = MatchingTool::JobFinder.new(
          candidate_working_hour: working_hour
        ).call

        render json: JobSerializer.new(jobs).serialized_json
      end
    end
  end
end
