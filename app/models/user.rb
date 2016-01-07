class User < ActiveRecord::Base
  has_many :tools
  has_secure_password

  #automatically creates def admin? and def admin!
  enum role: %w(default admin)
end
