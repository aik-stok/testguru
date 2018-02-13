module AssignmentHelper

  def result_message_class(assignment)
    if assignment.success?
      "success"
    else
      "fail"
    end
  end

  def result_message(assignment)
    if assignment.success?
      "Success"
    else
      "Test failed"
    end
  end

  def question_number
    "#{@assignment.test.questions.index(@assignment.current_question) + 1} /
     #{@assignment.test.questions.count}"
  end
    
end
