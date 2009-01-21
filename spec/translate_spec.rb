require File.dirname(__FILE__) + '/spec_helper'
require 'google_translate'

include GoogleTranslate

describe GoogleTranslate, 'translate' do
  it "should raise an error if the from language is missing or doesn't exist" do
    lambda {
      Translator.new(nil,'en')
    }.should raise_error(InvalidLanguage)
  end
  
  it "should raise an error if the to language is missing or doen't exist" do
    lambda {
      Translator.new('en','wk') # wookie speak
    }.should raise_error(InvalidLanguage)
  end
  
  it "should translate a string" do
    translator = Translator.new('en','fr')
    result = translator.translate("nice day today")
    result.should be == "belle journée aujourd'hui"
  end
  
  it "should raise an error if no response" do
    translator = Translator.new('en','fr')
    translator.stubs(:open).yields(StringIO.new) # stub empty response
    lambda {
      result = translator.translate("nice day today")      
    }.should raise_error(GoogleUnavailable)
  end
  
  # think how to handle this ... should it give a signal if the 
  # translation == the input ?
  it "should not translate if untranslateable string" do
    translator = Translator.new('en','fr')
    result = translator.translate("blaargh")
    result.should be == "blaargh"
  end
  
  it "should leave html encoding if required" do
    translator = Translator.new('en','fr')
    result = translator.translate("nice day today", :html => true)
    result.should be == "belle journée aujourd&#39;hui"
  end
end

describe GoogleTranslate, 'detect' do
  it "should detect the language of a string" do
    detect = LanguageDetect.new
    detect.detect("il fait beau aujourd'hui").should be == "fr"
  end
   
  it "should raise an error if no string" do
    detect = LanguageDetect.new
    lambda {
      detect.detect(nil)
    }.should raise_error(NoGivenString)
  end
  
  it "should raise an error if language not recognized" do
    detect = LanguageDetect.new
    lambda {
      detect.detect("bliiiioaarg oqsdkqsdf")
    }.should raise_error(UnreliableDetection)
  end
end