require 'erb'

class Controller
  attr_reader :controller_name, :action_name, :request_parameters
  attr_accessor :status, :headers, :content

  def initialize(controller_name, action_name, request_parameters = {})
    @controller_name = controller_name
    @action_name = action_name
    @request_parameters = request_parameters
    @template = File.read('./lib/create.html.erb')
  end

  def call
    send(action_name)
    self.status = 200
    self.headers = {'Content-Type'=>'text/html'}
    self.content = [render]
    self
  end

  def not_found
    self.status = 404
    self.headers = {}
    self.content = ['Page is not found!']
    self
  end

  def render
    temp = ERB.new(@template).result(binding)
  end
end
