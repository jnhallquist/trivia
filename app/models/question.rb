class Question < ApplicationRecord
  before_save { correct_answer&.empty? }

  validates :question, presence: true
  validates :choice_a, presence: true
  validates :choice_b, presence: true
  validates :choice_c, presence: true
  validates :choice_d, presence: true
  validates :correct_answer, presence: true
end
