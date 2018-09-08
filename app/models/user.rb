class User < ActiveRecord::Base
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :username, :presence => { message: "is required" }, :uniqueness => { message: "already registered" }, :length  => { :in => 3..20, message: "should contains between 3 and 20 characters" }
  validates :email, :presence => { message: "is required" }, :uniqueness => { message: "already registered" }, :format => { with: EMAIL_REGEX, message: "invalid" }
  validates :password, :length => { :in => 8..50, message: "should contains between 8 and 50 characters" }, :on => :create, :confirmation => true
  has_secure_password
end
