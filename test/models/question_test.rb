require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
    @question = Question.new(question: 'How many continents are there?',
                             choice_a: '5',
                             choice_b: '7',
                             choice_c: '9',
                             choice_d: '11',
                             correct_answer: 'b')
  end

  test 'should be valid' do
    assert @question.valid?
  end

  test 'question should be present' do
    @question.question = '     '
    assert_not @question.valid?
  end

  test 'choice_a should be present' do
    @question.choice_a = '     '
    assert_not @question.valid?
  end

  test 'choice_b should be present' do
    @question.choice_b = '     '
    assert_not @question.valid?
  end

  test 'choice_c should be present' do
    @question.choice_c = '     '
    assert_not @question.valid?
  end

  test 'choice_d should be present' do
    @question.choice_d = '     '
    assert_not @question.valid?
  end

  test 'correct_answer should be present' do
    @question.correct_answer = '     '
    assert_not @question.valid?
  end
end
