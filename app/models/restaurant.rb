# frozen_string_literal: true

class Restaurant < ApplicationRecord
  belongs_to :application, class_name: 'ClientApp'

  validates :name, presence: true

  def to_json(*_args)
    {
      id:,
      name:
    }
  end

  private

  def date_to_string(date) = date.iso8601(3)
end
