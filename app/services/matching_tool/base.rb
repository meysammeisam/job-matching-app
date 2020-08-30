module MatchingTool
  # MatchingTool::Base
  class Base
    extend Dry::Initializer

    MAX_PAGE_SIZE = 50

    option :page, optional: true, default: -> { 0 }
    option :per_page, optional: true, default: -> { 10 }

    private

    def paginate(relation)
      relation
        .page(page)
        .per(page_size)
    end

    def page_size
      [per_page, MAX_PAGE_SIZE].min
    end
  end
end
