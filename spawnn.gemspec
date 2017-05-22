# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spawnn/version'

Gem::Specification.new do |spec|
    spec.name           = 'spawnn'
    spec.version        = Spawnn::VERSION
    spec.authors        = ['Osho Giri']
    spec.email          = ['osho@linkwok.com']

    spec.summary        = 'Spawnn spawns your data in various file formats'
    spec.description    = spec.summary
    spec.homepage       = "TODO: Put your gem's website or public repo URL here."
    spec.license        = 'MIT'

    # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
    # to allow pushing to a single host or delete this section to allow pushing to any host.
    if spec.respond_to?(:metadata)
        spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
    else
        raise 'RubyGems 2.0 or newer is required to protect against ' \
          'public gem pushes.'
    end

    spec.files          = `git ls-files -z`.split("\x0").reject do |f|
        f.match(%r{^(test|spec|features)/})
    end
    spec.bindir         = 'exe'
    spec.executables    = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
    spec.require_paths  = ['lib']

    spec.add_development_dependency 'bundler', '~> 1.14'
    spec.add_development_dependency 'rake', '~> 10.0'

    spec.add_dependency             'prawn'
    spec.add_dependency             'prawn-table'
    spec.add_dependency             'rmagick'
    spec.add_dependency             'caracal'
    spec.add_dependency             'caracal-rails'
    spec.add_dependency             'pdfkit'
    spec.add_dependency             'wkhtmltopdf-binary'
end
