class Reports::CommentsController < CommentsController
  before_action :set_commentable
  
  private
  
  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

  def render_commentable_show
    @report = @commentable
    render 'reports/show'
  end
end