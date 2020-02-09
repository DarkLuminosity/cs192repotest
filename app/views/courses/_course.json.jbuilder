json.extract! course, :id, :classcode, :classname, :credits, :schedule, :room_place, :instructor, :created_at, :updated_at
json.url course_url(course, format: :json)
