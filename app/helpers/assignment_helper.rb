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
      t(:success_flash_message)
    else
      t(:fail_flash_message)
    end
  end

  def question_number
    "#{@assignment.test.questions.index(@assignment.current_question) + 1} /
     #{@assignment.test.questions.count}"
  end
    
end
