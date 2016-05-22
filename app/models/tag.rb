class Tag < AbstractModel
	has_and_belongs_to_many :forms
	has_and_belongs_to_many :norms
end
