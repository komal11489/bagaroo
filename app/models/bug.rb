class Bug < ActiveRecord::Base
	validates :title, :description, :presence=>true
	enum issue_type: [:issue, :enhancement, :feature]
	enum priority: [:low, :medium, :high]
	enum status: [:open, :closed, :monitor]
	belongs_to :user
end
