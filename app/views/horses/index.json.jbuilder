json.array!(@horses) do |horse|
  json.extract! horse, :id, :name, :nick, :birth, :height, :gender, :color_id, :dentist, :vet, :blacksmith, :osteopath, :blanket_size, :strap_size, :horsebit_size, :bridle_size, :comment
  json.url horse_url(horse, format: :json)
end
