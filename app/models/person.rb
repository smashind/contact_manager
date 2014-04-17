class Person < ActiveRecord::Base
	validates :first_name, :last_name, presence: true
	include Contact

	def full_name
      first_name + " " + last_name
    end

    def to_s
    	"#{last_name}, #{first_name}"
    end
end
