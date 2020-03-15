# This Token is needed to authenticate
# anyone who's trying to access the APIs
class AppToken < ApplicationRecord
  before_create :generate_random_token

  enum platform: %i[navbox dashboard mobile]

  TOKEN_SPACE = [('a'..'z'), ('A'..'Z'), (0..9),
                 ['-', '_', '@', '~', '*', '&', '^', '%', '$']].map(&:to_a).flatten

  validates :token, presence: true
  validates :token, uniqueness: { case_sensitive: true }

  scope :newest_first, -> { order('created_at desc') }

  def generate_token
    while self.class.exists?(token: token)
      self.token = (0...20).map { TOKEN_SPACE[rand(TOKEN_SPACE.length)] }.join if token.nil?
    end
  end

  def generate_random_token
    self.token = (0...20).map { TOKEN_SPACE[rand(TOKEN_SPACE.length)] }.join
  end
end
