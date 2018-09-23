name := "akka-http-microservice"
organization := "com.stacks"
version := "0.1.0"
scalaVersion := "2.11.8"

scalacOptions := Seq("-unchecked", "-deprecation", "-encoding", "utf8")

libraryDependencies ++= Vector(
  "com.typesafe.akka" %% "akka-http" % "10.0.5" 
)
