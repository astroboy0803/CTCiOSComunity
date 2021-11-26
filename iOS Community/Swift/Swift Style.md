# Swift Style
### 分號(semicolons)是optional，但「不要」使用
```
print("Hello swift")
print("Hello swift");
```

### 條件或迴圈的括號(parentheses)是optional，儘量「不要」使用
```
let random = Int.random(in: 1...10)

if (random % 2 == 0) {

}

if random % 2 == 0 {

}
```

### 條件或迴圈大括號(curly brackets)不可省略
```
let random = Int.random(in: 1...10)

// compiler error - 單行也不可省略
// if random % 2 == 0
//print(random)

if random % 2 == 0 {
	print(random)
}

```

### 指定運算子(operator)不會有回傳值
```
var i = 1
if i = 1 {
	print("i = \(i)")
}

while i = 1 {
	print("i = \(i)")
}
```

### 指定或條件的空白是optional，但要對稱
```
// compiler error
// var i= 10
// var i =10
var i = 10

var j=10

if i == 9 {
}
```