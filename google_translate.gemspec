Gem::Specification.new do |spec|
  spec.author = 'Elise Huard'
  spec.email = 'googletranslate@elisehuard.be'
  spec.homepage = 'http://github.com/elisehuard/google_translate'

  spec.name = 'google_translate'
  spec.version = '0.0.1'
  spec.date = "21-01-2009"

  spec.has_rdoc = true
  spec.summary = "google translate api for Ruby"
  
  spec.require_path = ["lib"]
  spec.files = ['lib/google_translate.rb',
                'lib/google_translate/exceptions.rb',
                'lib/google_translate/languages.rb',
                'lib/google_translate/parsed_response.rb',
                'lib/google_translate/translator.rb',
                'lib/google_translate/language_detect.rb']
  spec.test_files = ['spec/spec_helper.rb',
                     'spec/translate_spec.rb']

  spec.add_dependency('json', ["> 1.1.2"])
end
