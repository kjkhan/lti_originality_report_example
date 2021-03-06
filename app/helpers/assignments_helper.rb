module AssignmentsHelper
  # existing_assignment
  #
  # Attempts to find and return an assignment that already has been
  # configured and saved
  def existing_assignment
    @_existing_assignment ||= Assignment.find_by(lti_assignment_id: params['ext_lti_assignment_id'])
  end

  # edit_assignment?
  #
  # Returns true if the assignment being configured has already been configured
  # and saved previously
  def edit_assignment?
    existing_assignment.present?
  end

  # find_or_create_assignment
  #
  # Attempts to find and return an assignment that was previously configured
  # and returns a new assignment if none is found
  def find_or_create_assignment(tool_proxy:)
    @_assignment ||= begin
      assignment = Assignment.find_or_initialize_by(lti_assignment_id: params['ext_lti_assignment_id'])
      assignment.update_attributes!(tool_proxy: tool_proxy)
      assignment
    end
  end
end
