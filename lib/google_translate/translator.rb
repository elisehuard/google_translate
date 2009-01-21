module GoogleTranslate
  # manage translation of a given string from a given language to another language
  # <b>How to use</b>:
  #   translator = Translator.new("en","fr") # so several translations can be performed with this new object
  #   result = translator.translate("nice day today") # returns "belle journée aujourd'hui"
  class Translator
    SERVICE = "translate?v=#{VERSION}&langpair="
    TEXT_PAR = "&q="

    # initialize the translator with the language to translate from (from) and the language to translate to (to)
    def initialize(from,to)
      raise InvalidLanguage if !is_language?(from)
      raise InvalidLanguage if !is_language?(to)
      @from = from
      @to = to
    end

    # translate a string in the given languages
    # options so far:
    # - html: if html encoding is desirable (for immediate display on a web page for instance) 
    #           then this option needs to have a true value (:html => true)
    def translate(text, options = {})
      raise NoGivenString if text.nil?
      
      request = URL_STRING + SERVICE + @from + "%7C" + @to + TEXT_PAR + CGI.escape(text)
      response = ''
      open(request) { |f|
        response = f.read
      }
      raise GoogleUnavailable if response.nil? || response == ""
      
      parsed = TranslationResponse.new(response)
      raise GoogleException, parsed.details if parsed.status != 200 # success
      
      if options[:html]
        translation = parsed.translation
      else
        translation = CGI.unescapeHTML(parsed.translation)
      end
      translation # return value
      
    rescue OpenURI::HTTPError
      raise GoogleUnavailable
    end

  private
    def is_language?(lang)
      LANGUAGES.include?(lang)
    end
  end
  
  # to handle the translation response
  class TranslationResponse < ParsedResponse
    attr_reader :translation
    def initialize(string)
      super(string)      
      # here we unescape html escaped characters BUT if it's required to keep html format,
      # an extra option should be added
      @translation = @json['responseData']['translatedText'] if @json['responseData']
    end
  end
end