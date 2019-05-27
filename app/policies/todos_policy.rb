# app/policy/client_policy.rb
class TodosPolicy
  attr_reader :current_user, :resource

  def initialize(current_user:, resource:)
    @current_user = current_user
    @resource = resource
  end

  def can_mange?
    @resource.can_mange?(current_user)
  end
end
