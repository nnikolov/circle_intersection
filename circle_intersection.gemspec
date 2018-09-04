$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "circle_intersection/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "circle_intersection"
  s.version     = CircleIntersection::VERSION
  s.authors     = ["Nick Nikolov"]
  s.email       = ["nrnickolov@yahoo.com"]
  s.homepage    = "https://github.com/nnikolov/circle_intersection"
  s.summary     = "Calculates the intersection points of two circles"
  s.description = "Given two circles described by center point (x,y) and radius (r), finds the coordinates of the points of intersection"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"

  s.add_development_dependency "sqlite3"
end
