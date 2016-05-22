namespace :db do
	desc "Migrate tags"
	task migrate_tags: :environment do
	# Form.transaction do
	# 	Form.all.each do |form|
	# 		if (form.has_attribute?(:tag) )
	# 			tags = form.tag.split(/,| /)
	# 			tags.each do |code|
	# 				tag = Tag.find_or_create_by(code: code) do |t|
	# 				  t.name = MorphAnalyzer::TAGS[code]|| code
	# 				end
	# 				form.tags << tag if tag
	# 			end
	# 		end
	# 	end
	# end

	Norm.transaction do
		Norm.all.each do |norm|
			if (norm.has_attribute?(:tag) )
				tags = norm.tag.split(/,| /)
				tags.each do |code|
					tag = Tag.find_or_create_by(code: code) do |t|
						t.name = MorphAnalyzer::TAGS[code] || code
					end
					norm.tags << tag if tag
				end
			end
		end
	end
end
end
