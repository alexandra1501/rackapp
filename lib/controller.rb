require 'erb'

class String
  alias :each :each_char
end

class Controller
  attr_reader :controller_name, :action_name, :request_parameters
  attr_accessor :status, :headers, :content

  def initialize(controller_name, action_name, request_parameters = {})
    @controller_name = controller_name
    @action_name = action_name
    @request_parameters = request_parameters
  end

  def call
    send(action_name)
    self.status = 200
    self.headers = {'Content-Type'=>'text/html'}
    self.content = ERB.new(template).result(binding)
    self
  end

  def not_found
    self.status = 404
    self.headers = {}
    self.content = ['Page is not found!']
    self
  end

  def template
    File.read("./app/views/#{controller_name}/#{action_name}.html.erb")
  end
end
