class Router
  attr_reader :routes, :request_parameters

  def initialize(routes)
    @routes = routes
  end

  def resolve(env)
    path = env['REQUEST_PATH']
    if routes.key?(path)
      controller(routes[path]).call
    else
      Controller.new.not_found
    end
  end

  private

    def controller(string)
      controller_name, action_name = string.split('#')
      klass = Object.const_get "#{controller_name.capitalize}Controller"
      klass.new(controller_name, action_name, request_parameters)
    end
  end
