require File.dirname(__FILE__) + '/spec_helper'

describe GoogleTranslate, 'detect' do
  it "should detect the language of a string" do
    LanguageDetect.detect("il fait beau aujourd'hui").should be == "fr"
  end
   
  it "should raise an error if no string" do
    lambda {
      LanguageDetect.detect(nil)
    }.should raise_error(NoGivenString)
  end
  
  it "should raise an error if language not recognized" do
    lambda {
      LanguageDetect.detect("bliiiioaarg oqsdkqsdf")
    }.should raise_error(UnreliableDetection)
  end
end