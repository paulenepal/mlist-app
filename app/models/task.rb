class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user

  scope :today, -> { where(due_date: Date.current...(Date.current + 1), completed: false )}
  scope :overdue, -> { where("due_date < ? AND completed = ?", Date.current, false).order(due_date: :asc) }
  scope :completed, -> { where(completed: true) }
  scope :upcoming, -> {where(due_date: (Date.current + 1)..(Date.current + 2.weeks), completed: false).order(due_date: :asc)}

  validates :name, presence: true
  validates :description, length: { maximum: 200 }
end
