class Manager < EmployeeUser
  scope :newest_first, -> { order('created_at desc') }

  amoeba do
    enable
  end
end
