class User < ApplicationRecord
	validates :cpf , uniqueness: true
	validates :cpf, presence: true
	has_many :orders
	#accepts_nested_attributes_for :users
end
