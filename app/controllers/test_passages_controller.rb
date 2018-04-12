class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist rescue_from_validation_failed]

  rescue_from Octokit::UnprocessableEntity, with: :rescue_from_validation_failed

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    @test_passage.completed if (@test_passage.time_left < 1 )
    if @test_passage.completed?
      badges = GivingBadgesService.new(@test_passage).select_badges
      current_user.badges.push(badges)
      flash[:info] = 'Вы получили новый значок!' if badges.any?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    if result.created_at
      gist = current_user.gists.build(question_id: @test_passage.current_question_id, path: result.id)
      gist.save
      flash[:info] = t('.success', gist_link: view_context.link_to('Gist', result.html_url, :target => '_blank'))
    else
      flash[:danger] = t('.failure')
    end
    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def rescue_from_validation_failed
    flash[:danger] = t('.failure')
    redirect_back(fallback_location: @test_passage)
  end

end
