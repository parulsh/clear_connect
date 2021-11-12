json.array! @meetings do |meeting|
  json.id meeting.id
  json.title meeting.topic
  json.start meeting.start_time.strftime('%Y-%m-%dT%H:%M:%S')
end