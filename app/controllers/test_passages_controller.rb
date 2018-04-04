class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist rescue_from_validation_failed]
  before_action :set_timer_end, only: %i[show update]

  rescue_from Octokit::UnprocessableEntity, with: :rescue_from_validation_failed

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    @test_passage.completed if (params[:end_test_passage] == 'true')
    if @test_passage.completed?
      badges = check_badges
      current_user.badges.push(badges)
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

  def set_timer_end
    @timer_end = (@test_passage.created_at.to_f * 1000).to_i + @test_passage.test.timer * 60 * 1000
  end

  def rescue_from_validation_failed
    flash[:danger] = t('.failure')
    redirect_back(fallback_location: @test_passage)
  end

  def check_badges
    badges = []
    Badge.find_each do |badge|
      if Rule.send(badge.rule.method.to_sym, current_user) && !current_user.badges.exists?(badge.id)

        badges << badge
      end
    end

    badges
  end

end
