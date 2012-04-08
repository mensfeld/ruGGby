# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ruggby"
  s.version = "0.3.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Maciej Mensfeld"]
  s.date = "2012-04-08"
  s.description = "Gadu Gadu protocol client implementation in Ruby language"
  s.email = "maciej@mensfeld.pl"
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "README.md", "lib/ruggby.rb", "lib/ruggby/action/base.rb", "lib/ruggby/action/change_status.rb", "lib/ruggby/action/create_message.rb", "lib/ruggby/action/login.rb", "lib/ruggby/action/mark.rb", "lib/ruggby/action/new_message.rb", "lib/ruggby/action/ping.rb", "lib/ruggby/action/read.rb", "lib/ruggby/callback.rb", "lib/ruggby/client.rb", "lib/ruggby/converter.rb", "lib/ruggby/logger.rb", "lib/ruggby/packet/factory.rb", "lib/ruggby/packet/incoming/base.rb", "lib/ruggby/packet/incoming/login_status.rb", "lib/ruggby/packet/incoming/message.rb", "lib/ruggby/packet/incoming/welcome.rb", "lib/ruggby/packet/outgoing/base.rb", "lib/ruggby/packet/outgoing/change_status.rb", "lib/ruggby/packet/outgoing/login.rb", "lib/ruggby/packet/outgoing/mark.rb", "lib/ruggby/packet/outgoing/message.rb", "lib/ruggby/packet/outgoing/ping.rb", "lib/ruggby/password.rb", "lib/ruggby/socket.rb", "lib/ruggby/string_encoder.rb", "lib/ruggby/threader.rb", "lib/ruggby/version.rb"]
  s.files = ["CHANGELOG.rdoc", "Gemfile", "MIT-LICENSE", "README.md", "Rakefile", "init.rb", "lib/ruggby.rb", "lib/ruggby/action/base.rb", "lib/ruggby/action/change_status.rb", "lib/ruggby/action/create_message.rb", "lib/ruggby/action/login.rb", "lib/ruggby/action/mark.rb", "lib/ruggby/action/new_message.rb", "lib/ruggby/action/ping.rb", "lib/ruggby/action/read.rb", "lib/ruggby/callback.rb", "lib/ruggby/client.rb", "lib/ruggby/converter.rb", "lib/ruggby/logger.rb", "lib/ruggby/packet/factory.rb", "lib/ruggby/packet/incoming/base.rb", "lib/ruggby/packet/incoming/login_status.rb", "lib/ruggby/packet/incoming/message.rb", "lib/ruggby/packet/incoming/welcome.rb", "lib/ruggby/packet/outgoing/base.rb", "lib/ruggby/packet/outgoing/change_status.rb", "lib/ruggby/packet/outgoing/login.rb", "lib/ruggby/packet/outgoing/mark.rb", "lib/ruggby/packet/outgoing/message.rb", "lib/ruggby/packet/outgoing/ping.rb", "lib/ruggby/password.rb", "lib/ruggby/socket.rb", "lib/ruggby/string_encoder.rb", "lib/ruggby/threader.rb", "lib/ruggby/version.rb", "spec/callback_spec.rb", "spec/spec_helper.rb", "Manifest", "ruggby.gemspec"]
  s.homepage = "https://github.com/mensfeld/ruGGby"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Ruggby", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "ruggby"
  s.rubygems_version = "1.8.15"
  s.summary = "Gadu Gadu protocol client implementation in Ruby language"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.0.0"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end
