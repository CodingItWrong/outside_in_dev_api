module ApplicationHelper
  def server_domain
    [request.protocol, request.host_with_port].join
  end
end
