class Router
  attr_reader :routes

  def initialize(routes)
    @routes = routes
  end

  def resolve(env)
    request = Rack::Request.new(env)
    path = request.path_info
    if routes.key?(path)
      controller(routes[path], request.params).call
    else
      Controller.new("","",{content: nil}).not_found
    end
  end

  private

    def controller(string, request_parameters = {})
      controller_name, action_name = string.split('#')
      klass = Object.const_get "#{controller_name.capitalize}Controller"
      klass.new(controller_name, action_name, request_parameters)
    end
  end
