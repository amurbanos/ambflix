class Location < ApplicationRecord

	belongs_to :user

	def self.get_all_closer_to_user()
		#raise TypeError, 'Params must be type User' unless value.kind_of?(User)
		locations = self.find_by_sql(
			"SELECT 
			locations.id, 
			locations.user_id, 
			locations.latitude, 
			locations.longitude, 
			users.name, 
			(
			   3959 *
			   acos(cos(radians(-9.63586324)) * 
			   cos(radians(latitude)) * 
			   cos(radians(longitude) - 
			   radians(-35.69968075)) + 
			   sin(radians(-9.63586324)) * 
			   sin(radians(latitude )))
			)  
			AS distance FROM locations 
			LEFT JOIN
			users
			on users.id = locations.user_id
			HAVING distance < 1
			ORDER BY distance LIMIT 100;"
		)
		return locations
	end

	def set_invalid
	end 

end