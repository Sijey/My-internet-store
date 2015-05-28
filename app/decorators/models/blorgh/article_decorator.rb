Article::Post.class_eval do
	def time_since_created
		Time.current - created_at
	end

	def summary
		"#{title} - #{truncate(text)}"
	end
end
