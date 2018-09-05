# CircleIntersection
To calculate the intersection points of two circles if any.

## Usage
    c1 = Circle.new(x: 10, y: 10, r: 10)
    c2 = Circle.new(x: 10, y: 14, r: 10)

    intersection = c1.points_of_intersection(c2)

    intersection[0].x  # 19.79795897113271
    intersection[0].y  # 12
    intersection[1].x  # 0.20204102886728847
    intersection[1].y  # 12

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'circle_intersection', '0.1.0', git: 'https://github.com/nnikolov/CircleIntersection.git'

```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ git clone git@github.com:nnikolov/circle_intersection.git CircleIntersection
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
