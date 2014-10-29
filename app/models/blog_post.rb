class BlogPost < ActiveRecord::Base

	has_many :comment, as: :commentable

end
