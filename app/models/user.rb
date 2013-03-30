class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :rememberable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable, #end defaults (I removed rememberable, so no cookies. can back later.)
         :confirmable, :timeoutable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation #, :remember_me
  # attr_accessible :title, :body

  # these validations are redundant - they're ensured through a combination of the database migration/definition and in
  # devise.rb initializer and in the :validatable module. Put here for documentation mainly.
  # validates :email, :presence => true
  # validates :password, :presence => true, :length => { :minimum => 10, :maximum => 128 }


  # TODO add in :username:string, :cu:boolean fields.
  
  ### ASSOCIATIONS (added 03/28/2013)
  has_many :goals
  has_many :indicators
  has_many :owned_projects, :class_name => "Project", :foreign_key => :head_id
  has_many :steering_projects, :class_name => "Project", :foreign_key => :steer_id
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :activities

  ### Email Account Creation
  # The following method of achieving this with devise is from
  # https://github.com/plataformatec/devise/wiki/How-To:-Email-only-sign-up

  def password_required?
    super if confirmed?
  end

  def password_match?
    self.errors[:password] << "can't be blank" if password.blank?
    self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

end
