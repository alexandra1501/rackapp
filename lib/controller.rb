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
    self.content = [template.render(self)]
    self
  end

  def not_found
    self.status = 404
    self.headers = {}
    self.content = ['Nothing found']
    self
  end

  def template
    Slim::Template.new(File.join(App.root, 'app', 'views', "#{self.controller_name}", "#{self.action_name}.slim"))
  end
end
