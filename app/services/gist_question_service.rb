class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || Octokit::Client.new
    @client.access_token= ENV['GIT_TOKEN']
  end

  def call
    @client.create_gist(gist_params)
  end
  
  def gists
    @client.gists
  end

  private

  def gist_params
        {
      "description": I18n.t("gist_description", title: @test.title),
      "public": true,
      "files": {
        "testguru_question.txt": {
          "content": gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end 