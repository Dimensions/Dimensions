#Style
This is the coding style for Dimensions (and other Dimensions related projects, including [Solar](https://github.com/dimenisons/Solar)).

##Code blocks
###Indentation
The inner code of a code block should be preceded four spaces.
```java
{
    test();
1234
}
```
###`{`
`{` goes after the type of the block with a space preceding it.
```java
public class Test {
    public test() {
    }
}
```
###`if` statements
`if` statements have a space in between the parameter and `if`.
```java
if (true) { 
    test();
}
```
This goes for `for`, `while`, `do`, `try`, `catch`, and other blocks.
####`else`
`else` statements should have a space between `}` and `else`.
```java
if (true) {
} else {
}
```
####`if-else`
If one liner branching should occur, you shouldn't put brackets.
```java
if (true)
    test();
else
    noTest();
```
