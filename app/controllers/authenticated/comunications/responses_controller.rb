class Authenticated::Communications::ResponsesController < Authenticated::BaseController

  def create

  end

  protected

  def question
    @question ||= Communications::Question.find(params[:question_id])
  end

end