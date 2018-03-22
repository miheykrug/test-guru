class Admin::TestPassagesController < Admin::BaseController
  def gists
    @gists = Gist.all
  end
end
