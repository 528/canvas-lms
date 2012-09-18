module DataFixup::RemoveBogusEnrollmentAssociatedUserIds
  def self.run
    Enrollment.find_ids_in_ranges do |first, last|
      Enrollment.update_all({:associated_user_id => nil},
        ["type <> 'ObserverEnrollment' AND id >= ? AND id <= ?",
         first, last])
    end
  end
end
