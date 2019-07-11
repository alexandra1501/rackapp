class Router
  attr_reader :routes

  def initialize(routes)
    @routes = routes
  end

  def resolve(env)
    path = env['REQUEST_PATH']
    request_parameters = get_parameters(env['rack.input'].read.gsub(/\+/," "))
    if routes.key?(path)
    controller(routes[path], request_parameters).call
    else
      Controller.new.not_found
    end
  end

  private

    def controller(string, request_parameters = {})
      controller_name, action_name = string.split('#')
      klass = Object.const_get "#{controller_name.capitalize}Controller"
      klass.new(controller_name, action_name, request_parameters)
    end

    def get_parameters(request_parameters)
      request_parameters.split('&').map { |param| param.split('=')}.to_h
    end
  end
