json.array! @images do |image|
  json.partial! 'image.json.jbuilder', { image: image }
end

