class RequestParser
  def self.parse(request)
    method, path, version = request.lines[0].split
    headers = request.lines[1..-1].join
    {
      path: path,
      method: method,
      headers: RequestParser.parse_headers(headers)
    }
  end

  def self.parse_headers(request_headers)
    headers = {}
    request_headers.lines.each do |line|
      return headers if line == "\r\n"
      
      header, value = line.split
      header        = RequestParser.normalize(header)

      headers[header] = value
    end
    headers
  end

  private 

  def self.normalize(header)
    header.gsub(':', "")
  end
end