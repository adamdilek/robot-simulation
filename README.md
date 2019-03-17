# Robot Simulator

## Run in your local

```
bundle install

ruby main.rb
```

## Run tests

```
bundle exec rspec
```

## Example Data

* Example 1

INPUT

```
PLACE 1,3,WEST
MOVE
MOVE
```

OUTPUT

```
The robot going to fall down. We did not move the robot anywhere.
```

* Example 2


INPUT

```
MOVE
```

OUTPUT

```
You should first place robot on the table.
```

* Example 3

INPUT
```
PLACE, 0,0,NORTH
MOVE
REPORT
``` 
OUTPUT

```
Output: 0, 1, NORTH
```

* Example 4

INPUT
```
PLACE 0,0,NORTH
LEFT
REPORT
``` 
OUTPUT

```
Output: 0, 0, WEST
```