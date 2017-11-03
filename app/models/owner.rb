class Owner < ApplicationRecord
  has_many :machines

  has_many :snacks, through: #joins table
end
