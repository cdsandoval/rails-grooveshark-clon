class Album < ApplicationRecord
  validates :title, presence: true,
            length: {minimum:1, maximum:300}

end
