# Learning Scala

## Resources

- [Scala school (twitter)](https://twitter.github.io/scala_school/index.html)

## Getting started

```Bash
$ docker build --rm -t local/scala .
$ docker run -it --rm -v $PWD:/app local scala amm
```


## Fight

```Scala
// define a package
package com.hackliff.learn

// abstract class
abstract class Machine {
  def add(m: Int, n: Int): Int
}

class Calculator(brand: String) extends Machine {
  var color: Stirng = brand match {
    case "TI" => "Texas Instrument"
    case _ => "unknown"
  }

  def add(m: Int, n: Int): Int = m + n
}

// inheritence
class ScientificCalculator(brand: String) extends Calculator(brand) {
 def log(m: Double, base: Double) = math.log(m) / math.log(base)
}

val calc = new ScientificCalculator("TI")
println(calc.color)
calc.log(2, 3)

// objects, function as objects and apply
object addOffset extends Function1[Int, Int] {
  val offset = 5
  def apply(n: Int): n + offser
}
addOffset(3)

// generics
def out[K](key: K) { println(key) }
out("hello"); out(5)
println("hello %s".format("world"))
```

```Scala
val numbers = Array(1, 2, 3, 4, 5, 1, 2, 3, 4, 5)
// lists are immutable arrays, i.e. this is impossible:
numbers(3) = 10
// sets are unordered, deduplicated lists
// tuples are... weird
val hostPort = ("localhost", 80)
println(hostPort._1)
val kv = Map("foo" -> "bar", "port" -> 80, "repr" -> { 3 + 3  })
kv("repr")
// use options
val unexpected = kv.get("notthere").getOrElse("omg")
// we get nice pattern matching
kv.get("foo") match {
  case Some(n) => "got it: %s".format(n)
  case None => "what?"
}

// combinators
// forEach does the same, without returning anything
val numbers = List(1, 2, 3, 4)
numbers.map((i: Int) => i * 2)
// or
numbers.map(_ * 2)
// partitions
val numbers = List(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
numbers.partition(_ > 5)
// same goes with find
// Functional combinators work with Maps
val clients = Map("steve" -> 100, "bob" -> 101, "joe" -> 201)
clients.filter((room: (String, Int)) => room._2 < 200)
// or with pattern matching
clients.filter({ case (name, num) => num < 200 })
```
