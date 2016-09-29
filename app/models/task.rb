class Task < ActiveRecord::Base
  #
  def check_complete
    complete_q = complete ? "status: completed at #{completed_at}" : "status: incomplete"
    return complete_q
  end


end
