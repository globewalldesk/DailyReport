class Report < ApplicationRecord
  belongs_to :user
  self.per_page = 10 # Default will_paginate value.
end
