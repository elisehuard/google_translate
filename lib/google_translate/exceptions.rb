module GoogleTranslate
  
  # Invalid language (or more specifically not one in existing list)
  class InvalidLanguage < Exception
  end
  
  # no response returned to request
  class GoogleUnavailable < Exception
  end
  
  # the status of the response indicates an error
  class GoogleException < Exception
  end
  
  # the detection of the language is deemed unreliable by google.
  class UnreliableDetection < Exception
  end
  
  # if no string is furnished for translation or detection
  class NoGivenString < Exception
  end
end