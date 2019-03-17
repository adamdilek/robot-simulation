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

INPUT

```
PLACE 3,3,WEST
LEFT
MOVE
LEFT
MOVE
PLACE 1,1,NORTH
REPORT
```

OUTPUT

```
Output: 1, 1, NORTH
```

### ----------------------

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

### ----------------------


INPUT

```
MOVE
```

OUTPUT

```
You should first place robot on the table.
```

### ----------------------

INPUT
```
PLACE 0,0,NORTH
MOVE
REPORT
``` 
OUTPUT

```
Output: 0, 1, NORTH
```

### ----------------------

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