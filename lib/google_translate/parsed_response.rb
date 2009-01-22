module GoogleTranslate
  # superclass for parsing the response: contains the common elements
  class ParsedResponse
    attr_reader :status, :details
    def initialize(string)
      json = JSON.parse(string)
      @status = json['responseStatus']
      @details = json['responseDetails']
      @response_data = json['responseData']
    end
  end
end