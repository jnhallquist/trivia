require 'test_helper'

class QuestionCreationTest < ActionDispatch::IntegrationTest
  test "invalid question information" do
    get new_question_path
    assert_no_difference "Question.count" do
      post questions_path,
        params: { question: { question: "How many continents are there?",
                              choice_a: "5",
                              choice_b: "7" } }
    end
    assert_template "questions/new"
  end

  test "valid question information" do
    get new_question_path
    assert_difference "Question.count", 1 do
      post questions_path,
        params: { question: { question: "How many continents are there?",
                              choice_a: "5",
                              choice_b: "7",
                              choice_c: "9",
                              choice_d: "11",
                              correct_answer: "b" } }
    end
    follow_redirect!
    assert_template "questions/show"
  end
end
