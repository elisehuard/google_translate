module GoogleTranslate
  # manage language detection based on a given string of text
  # <b>how to use</b>:
  #   detector = LanguageDetect.new<br/>
  #   language = detector.detect("il fait beau aujourd'hui") # returns "fr"
  class LanguageDetect
    SERVICE = "detect?v=#{VERSION}&q="
    
    # detect the language of a given text.
    def detect(text)
      raise NoGivenString if text.nil?
      
      request = URL_STRING + SERVICE + CGI.escape(text)
      response = ''
      open(request) { |f|
        response = f.read
      }
      raise GoogleUnavailable if response.nil? || response == ""
      
      parsed = DetectResponse.new(response)
      raise GoogleException, parsed.details if parsed.status != 200
      raise UnreliableDetection if !parsed.is_reliable
      
      parsed.language # return value
      
    rescue OpenURI::HTTPError
      raise GoogleUnavailable
    end
  end
  
  # to handle the detection response
  class DetectResponse < ParsedResponse
    attr_reader :language, :is_reliable, :confidence
    def initialize(string)
      super(string)      
      @language = @json['responseData']['language']
      @is_reliable = @json['responseData']['isReliable']
      @confidence = @json['confidence']
    end
  end
end