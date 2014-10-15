require 'rubygems'

ONE_DAY = 60 * 60 * 24

def remaining_days end_time, start_time
  if start_time > Time.now 
    (end_time - start_time).to_i / ONE_DAY
  else
    (end_time - Time.now).to_i / ONE_DAY    
  end
end