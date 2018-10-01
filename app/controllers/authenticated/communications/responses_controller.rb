class Authenticated::Communications::ResponsesController < Authenticated::BaseController

  def create
    if question.record_response!(current_user)
      redirect_to authenticated_communications_path, notice: "Thanks for responding!"
    else
      redirect_to authenticated_communications_path, alert: 'Oops, looks like something went wrong'
    end
  end

  protected

  def question
    @question ||= ::Communications::Question.find(params[:question_id])
  end

end