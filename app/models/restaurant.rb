class Restaurant < ApplicationRecord
  belongs_to :application, class_name: 'ClientApp'

  validates :name, presence: true

  def to_json(*_args)
    {
      id: id,
      name: name,
      created_at: date_to_string(created_at),
      updated_at: date_to_string(updated_at),
    }
  end

  private

  def date_to_string(date) = date.iso8601(3)
end
