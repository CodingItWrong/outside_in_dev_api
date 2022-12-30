# frozen_string_literal: true

class Movie < ApplicationRecord
  belongs_to :application, class_name: "ClientApp"

  validates :title, presence: true

  def to_json(*_args)
    {
      id:,
      title:,
      addedToday: added_today
    }
  end

  def added_today
    created_at >= start_of_today
  end

  private

  def start_of_today
    Time.zone.now.beginning_of_day
  end
end
