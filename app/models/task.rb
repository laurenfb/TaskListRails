class Task < ActiveRecord::Base
  belongs_to :user
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

  private
  def self.login_or_out_button(id)
    if id
      "<a href='/logout'>logout</a>".html_safe
    else
      "<a href='/auth/github'>login</a>".html_safe
    end
  end

end
