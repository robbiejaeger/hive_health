json.array! @sites do |site|
  json.extract! site, :id, :name, :description, :street, :city, :state, :zip, :longitude, :latitude, :status

  json.hives site.hives, :id, :name, :description
end
