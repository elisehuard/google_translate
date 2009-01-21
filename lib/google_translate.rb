require 'open-uri'
require 'cgi'
require 'rubygems'
require 'json'

# google translate API gem
# This is based on the documentation found here
# http://code.google.com/apis/ajaxlanguage/documentation/#Versioning
# look for the paragraph 'Flash and other Non-Javascript Environments'
#
# look at the Translator and LanguageDetect class (or README file) for instructions
module GoogleTranslate
end

require 'google_translate/exceptions'
require 'google_translate/languages'
require 'google_translate/parsed_response'
require 'google_translate/translator'
require 'google_translate/language_detect'
