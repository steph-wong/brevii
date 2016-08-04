class Summary < ApplicationRecord
  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :movie_id, presence: true

  validates :content, presence: true,
            length: { is: 10, tokenizer: -> (str) { str.scan(/\w+/) } }

end

private

def words_in_essay
  essay.scan(/w+/)
end
