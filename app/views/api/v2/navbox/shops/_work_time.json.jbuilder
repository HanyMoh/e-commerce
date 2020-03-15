json.extract! work_time, :id, :sat, :sun, :mon, :tue, :wed, :thu, :fri unless work_time.nil?
json.opening_at time(work_time.try(:opening_at))
json.closing_at time(work_time.try(:closing_at))
