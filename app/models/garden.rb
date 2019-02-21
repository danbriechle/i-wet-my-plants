class Garden < ApplicationRecord
  validates_presence_of :name,
                        :twitter_handle,
                        :zip_code
  belongs_to :user
  has_many :plants
  validates_length_of :zip_code, :maximum => 5
  has_one :api_key


  def plants_by_water_need
    unless plants.empty?
      plants.select("plants.*, (EXTRACT(EPOCH FROM ((NOW()) - (last_watered))) - (frequency - 6) * 3600) as needing_water")
            .order('needing_water desc')
    else
      []
    end
  end

  def reset_watering
    plants.update_all(last_watered: Time.now)

  def plants_that_need_water
    plants.select("plants.*, (EXTRACT(EPOCH FROM ((NOW()) - (last_watered))) - (frequency - 6) * 3600) as needing_water").where("EXTRACT(EPOCH FROM ((NOW()) - (last_watered))) > (frequency - 6) * 3600").order('needing_water desc')
  end

  def plants_that_need_water_api
    plants.select("plants.*, (EXTRACT(EPOCH FROM ((NOW()) - (last_watered))) - (frequency) * 3600) as needing_water").where("EXTRACT(EPOCH FROM ((NOW()) - (last_watered))) > (frequency) * 3600").order('needing_water desc')
  end
end
