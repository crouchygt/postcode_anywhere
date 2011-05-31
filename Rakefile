require 'rake/gempackagetask'
PKG_FILES = FileList[
  '[a-zA-Z]*',
  'generators/**/*',
  'lib/**/*',
  'rails/**/*',
  'tasks/**/*',
  'test/**/*'
]
 
spec = Gem::Specification.new do |s|
  s.name = "postcode_anywhere"
  s.version = "0.2"
  s.author = "Matthew Crouch"
  s.email = "mcrouch@mobilezil.la"
  s.homepage = "http://github.com/mobzilla/postcode_anywhere"
  s.platform = Gem::Platform::RUBY
  s.summary = "Find addresses by postcode and building number via Postcode Anywhere API"
  s.files = PKG_FILES.to_a
  s.require_path = "lib"
  s.has_rdoc = false
  s.extra_rdoc_files = ["README.markdown"]
  s.add_dependency("httparty", "~> 0.7.7")
end
 
desc 'Turn this plugin into a gem.'
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end