class Authenticated::Communications::ResponsesController < Authenticated::BaseController

  def create
    if question.record_response!(current_user)
      redirect_to authenticated_dashboards_path
    else
      redirect_to authenticated_dashboards_path, alert: 'Oops, looks like something went wrong'
    end
  end

  protected

  def question
    @question ||= ::Communications::Question.find(params[:question_id])
  end

end