module GoogleTranslate
  # manage language detection based on a given string of text
  # <b>how to use</b>:
  #   language = LanguageDetect.detect("il fait beau aujourd'hui") # returns "fr"
  class LanguageDetect
    extend ApiCall
    SERVICE = "detect?v=#{VERSION}&q="
    
    # detect the language of a given text.
    def self.detect(text)
      response = google_api_call(text,"#{SERVICE}",DetectResponse)   
      raise UnreliableDetection if !response.is_reliable  
      response.language # return value
    end
  end
  
  # to handle the detection response
  class DetectResponse < ParsedResponse
    attr_reader :language, :is_reliable, :confidence
    def initialize(string)
      super(string)      
      @language = @response_data['language']
      @is_reliable = @response_data['isReliable']
      @confidence = @response_data['confidence']
    end
  end
end