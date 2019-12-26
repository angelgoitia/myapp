class Shedule < ApplicationRecord
  belongs_to :user
  belongs_to :teacher

  validates_uniqueness_of :teacher_id
end
