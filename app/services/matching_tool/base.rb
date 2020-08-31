module MatchingTool
  # MatchingTool::Base
  class Base
    extend Dry::Initializer

    MAX_PAGE_SIZE = 50

    option :page, optional: true, default: -> { 0 }
    option :per_page, optional: true, default: -> { 10 }

    def call
      paginate sorted_matched_results
    end

    private

    def paginate(relation)
      relation
        .page(page)
        .per(page_size)
    end

    def sorted_matched_results
      subject_model
        .select('
          inner_query.*,
          (
            COALESCE(match_location, 0) +
            COALESCE(match_working_hour, 0) +
            COALESCE(match_job_type,0)
          ) as matching_rate')
        .from(matched_results, :inner_query)
        .order(matching_rate: :desc)
    end

    def page_size
      [per_page, MAX_PAGE_SIZE].min
    end
  end
end
