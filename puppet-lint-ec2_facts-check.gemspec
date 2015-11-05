Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-ec2_facts-check'
  spec.version     = '0.1.0'
  spec.homepage    = 'https://github.com/camptocamp/puppet-lint-ec2_facts-check'
  spec.license     = 'Apache-2.0'
  spec.author      = 'Camptocamp'
  spec.email       = 'mickael.canevet@camptocamp.com'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.test_files  = Dir['spec/**/*']
  spec.summary     = 'A puppet-lint plugin that helps to convert from ec2_* facts to ec2_metadata[].'
  spec.description = <<-EOF
    A puppet-lint plugin to convert from ec2_* facts to ec2_metadata[].
  EOF

  spec.add_dependency             'puppet-lint', '~> 1.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its', '~> 1.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
  spec.add_development_dependency 'rake'
end
