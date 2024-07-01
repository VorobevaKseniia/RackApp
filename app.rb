require_relative 'time_service'

class App
  def call(env)
    request = Rack::Request.new(env)
    format = request.params["format"]

    if request.path_info == "/time" && format
      time_response = TimeService.new(format)
      time_response.format_time
      time_response.success? ?
           response(200, "#{time_response.time_string}\n") :
           response(400, "Unknown time format #{time_response.errors}\n")
    else
      response(404, "Error!\n")
    end
  end

  private

  def response(status, body)
    [
      status,
      { 'Content-Type' => 'text/plain' },
      [body]
    ]
  end

end
