[![Travis CI](https://travis-ci.org/RSLayout/RSLayout.svg?branch=master)](https://travis-ci.org/RSLayout/RSLayout)

# RSLayout
This is a collection of helper functions to layout views in Swift.

## Features
* Set the width, height or size of a view
* Center a view horizontally or vertically in its superview
* Size a view to the width or height of its superview
* Size a view to fill its superview


## Usage

### Changing the size of a view
Change the width or height of a view

```Swift
view.layoutWidth(30.0)
view.layoutHeight(40.0)
```

Or change both width and height at once

```Swift
view.layoutHeight(30.0)
```

### Full width or height 
Fill the view's width or height out to its superview


```Swift
view.layoutFullWidth()
view.layoutFullHeight()
```

Add an optional margin to the leading / trailing or top / bottom edge of the view

```Swift
layout.layoutFullWidth(10.0)
layout.layoutFullHeight(10.0)
```

### Centering 
Center a view in its superview horizontally or vertically

```Swift
view.layoutCenterHorizontally()
view.layoutCenterVertically()
```

Or center it in both directions

```Swift
view.layoutCenter()
```

### Storing the created constraints
If you want you can store the constraints that RSLayout creates in order to clear them or replace them later on.


```Swift
let constraintGroup = view.layoutFullWidth()

view.clearConstraintGroup(constraintGroup)

view.layoutWidth(30.0)
```
