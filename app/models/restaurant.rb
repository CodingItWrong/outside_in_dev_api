class Restaurant < ApplicationRecord
  belongs_to :application, class_name: 'ClientApp'
end
