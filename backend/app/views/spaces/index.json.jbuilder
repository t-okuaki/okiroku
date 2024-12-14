json.array! @spaces do |space|
  json.partial! 'spaces/space', space: space
end
