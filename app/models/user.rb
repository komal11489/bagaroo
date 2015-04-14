class User < ActiveRecord::Base
	validates :fname, :lname, :email, :presence => true
 	validates :email, :uniqueness => true
 	validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
 	validates :thumbnail, allow_blank: true, 
 	format: {with: %r{\.(gif|jpg|png)\Z}i,
	message: 'must be a URL for GIF, JPG or PNG image.'}
	has_many :bugs
	
def full_name
	"#{fname} #{lname}"
end
end
