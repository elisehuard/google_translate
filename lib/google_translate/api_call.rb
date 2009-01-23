module GoogleTranslate
  module ApiCall
    def google_api_call(text,params,klas)
      raise NoGivenString if text.nil?
      
      request = URL_STRING + params + CGI.escape(text)
      response = ''
      open(request) { |f|
        response = f.read
      }
      raise GoogleUnavailable if response.nil? || response == ""
      
      parsed_response = klas.new(response)
      raise GoogleException, parsed_response.details if parsed_response.status != 200 # success
      
      parsed_response # return response class
      
    rescue OpenURI::HTTPError
      raise GoogleUnavailable
    end
  end
end