class Summary < ApplicationRecord
  belongs_to :user
  belongs_to :summary

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :movie_id, presence: true
  # validates :content, presence: true, length: { maximum: 140 }

  validates :content,
            presence: true,
            :length => {
            :is => 10,
            :tokenizer => lambda { |str| str.split },
            :too_short => "must be 10 words",
            :too_long  => "must be 10 words"
          }

  validates_length_of :content, is: 10, message: "must be 10 words"

end

private

def words_in_essay
  essay.scan(/w+/)
end
