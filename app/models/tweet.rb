class Tweet < ApplicationRecord
  validates :content, presence: true, length: { maximum: 240 }
end
