class Snack < ApplicationRecord

  has_many :machines

  has_many :owners, through: #joins table

end
