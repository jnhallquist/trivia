require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get questions_url
    assert_response :success
  end

  test 'should create question' do
    assert_difference('Question.count') do
      post questions_url, params: {
        question: {
          question: 'How many continents are there?',
          choice_a: '5',
          choice_b: '7',
          choice_c: '9',
          choice_d: '11',
          correct_answer: 'b'
        }
      }
    end
    assert_redirected_to question_path(Question.last)
  end

  test 'should show question' do
    question = questions(:one)
    get question_url(question)
    assert_response :success
  end

  test 'should edit question' do
    question = questions(:one)
    get edit_question_url(question)
    assert_response :success
  end

  test 'should destroy question' do
    question = questions(:one)
    assert_difference('Question.count', -1) do
      delete question_url(question)
    end

    assert_redirected_to questions_path
  end

  test 'should update question' do
    question = questions(:one)

    patch question_url(question), params: {
      question: {
        question: 'How many continents are there?',
        choice_a: '11',
        choice_b: '9',
        choice_c: '7',
        choice_d: '5',
        correct_answer: 'c'
      }
    }

    assert_redirected_to question_path(question)
    question.reload
    assert_equal '11', question.choice_a
  end
end
