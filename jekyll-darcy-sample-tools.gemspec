Gem::Specification.new do |s|
    s.name        = 'jekyll-darcy-sample-tools'
    s.version     = '0.1.0'
    s.summary     = 'Parse color strings and dynamically create .sample color palette files within Jekyll.'
    s.authors     = ["Darcy Supply Ltd.", "Harry Stanton"]
    s.email       = 'harry@darcysupply.com'
    s.files       = Dir['lib/**/*.rb', 'README.md', 'LICENSE'].to_a
    s.homepage    = 'https://github.com/darcysupply/jekyll-darcy-sample-tools'
    s.license     = 'MIT'

    s.add_runtime_dependency 'jekyll', '>= 3.5', '< 5.0'
    s.add_runtime_dependency 'jekyll-watch', '~> 2.0'
    s.add_runtime_dependency 'liquid', '~> 4.0'
end