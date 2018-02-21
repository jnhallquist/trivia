class Question < ApplicationRecord
  validates :question,
    presence: true

  validates :choice_a,
    presence: true

  validates :choice_b,
    presence: true

  validates :choice_c,
    presence: true

  validates :choice_d,
    presence: true
end
