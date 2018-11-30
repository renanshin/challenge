class Order < ApplicationRecord
	validates :cel_model, :imei, :price, :status, presence: true
	validates :imei , uniqueness: true
  belongs_to :user
  accepts_nested_attributes_for :user
end
