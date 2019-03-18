# Songs have the following attributes and limitations:

# title, a string
# Must not be blank
# Cannot be repeated by the same artist in the same year
# released, a boolean describing whether the song was ever officially released.
# Must be true or false
# release_year, an integer
# Optional if released is false
# Must not be blank if released is true
# Must be less than or equal to the current year
# artist_name, a string
# Must not be blank
# genre, a string


# def expiration_date_cannot_be_in_the_past
#     if expiration_date.present? && expiration_date < Date.today
#       errors.add(:expiration_date, "can't be in the past")
#     end
#   end
 
#   def discount_cannot_be_greater_than_total_value
#     if discount > total_value
#       errors.add(:discount, "can't be greater than total value")
#     end
#   end
# end

class Song < ApplicationRecord
    
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: { scope: :release_year,
        message: "should happen once per year" }
    validates :release_year, presence: true, if: :released?
    validate :release_year_is_valid, if: :released?

    def release_year_is_valid
        if !release_year.nil? && release_year > Date.current.year
            errors.add(:release_year, "can't be in the future")
        end
    end


end
