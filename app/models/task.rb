class Task < ActiveRecord::Base
  #
  def check_complete
    complete_q = complete ? "status: completed at #{completed_at}" : "status: incomplete"
    return complete_q
  end

  def mark_complete(status)
    if status
      self.complete = status
      self.completed_at = Time.zone.now
    end
  end


end
