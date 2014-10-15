require 'rubygems'

ONE_DAY = 60 * 60 * 24

def remaining_days end_time, start_time
  if start_time > Time.now 
    (end_time - start_time).to_i / ONE_DAY
  else
    (end_time - Time.now).to_i / ONE_DAY    
  end
end

def campaign_status end_time, start_time, error = 0
  return "images/red.png" if error != 0
  return "images/yellow.png" if start_time > Time.now
  return "images/grey.png" if end_time < Time.now
  return "images/green.png"
end