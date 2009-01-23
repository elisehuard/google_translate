# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{google_translate}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Elise Huard"]
  s.date = %q{2009-01-23}
  s.description = %q{Google Translate Ruby API - based on google documentation}
  s.email = %q{googletranslate@elisehuard.be}
  s.files = ["VERSION.yml", "lib/google_translate", "lib/google_translate/api_call.rb", "lib/google_translate/exceptions.rb", "lib/google_translate/language_detect.rb", "lib/google_translate/languages.rb", "lib/google_translate/parsed_response.rb", "lib/google_translate/translator.rb", "lib/google_translate.rb", "spec/detect_spec.rb", "spec/spec_helper.rb", "spec/translate_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/elisehuard/google_translate}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Google Translate Ruby API}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
