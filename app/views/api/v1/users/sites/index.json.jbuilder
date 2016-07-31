json.array! @sites do |site|
  json.id site.id
  json.name site.name
  json.description site.description
  json.street site.street
  json.city site.city
  json.state site.state
  json.zip site.zip
  json.longitude site.longitude
  json.latitude site.latitude

  json.hives site.hives, :id, :name, :description
end
