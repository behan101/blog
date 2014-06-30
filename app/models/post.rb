class Post < ActiveRecord::Base
	validates_presence_of :title, :content
	validates :title, :length => { :minimum => 2 }
	validates_uniqueness_of :title
end
