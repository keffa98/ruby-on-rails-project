class Car < ApplicationRecord
    # belongs_to :users
    has_many :carsDetail, dependent: :destroy
end
