# Roll the dice 🎲

Last week’s exercises introduced the concept of iteration and collections. You have learned about looping using `for`, `while`, and `foreach`. In this exercise, you will learn about the [`Random` class](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/Random.html) and what *persistent memory* is.

### 💀 Deadline

This work should be completed before the exercise, on **Weekday 10th Month** depending on your group.

### 👩‍🏫 Instructions

For instructions on how to do and submit the assignment, please see the
[assignments section of the course instructions](https://gits-15.sys.kth.se/inda-21/course-instructions#assignments).

### 📝 Preparation

You must read and answer the questions in the OLI material for Module 2.

- Read [Module y: title of module]([link to OLI](https://www.youtube.com/watch?v=dQw4w9WgXcQ))
- If you have not done so, goto https://kth.oli.cmu.edu/, signup and register for the course key `dd1337-ht22`

### ✅ Learning Goals

This week's learning goals include:

1. Understanding the Java `Random` object
2. Understanding the ternary operator
3. Know the difference between a deep and a shallow copy
4. Finding and fixing bugs
5. How to handle input and output (I/O)
6. Using an Iterator to modify a collection during iteration
7. **Optional**: Using inheritance to avoid code duplication 


### 🚨 Troubleshooting Guide

If you have any questions or problems, follow this procedure: <br/>

1. Look at this week's [posted issues](https://gits-15.sys.kth.se/inda-22/help/issues). Are other students asking about your problem?
2. If not, post a question yourself by creating a [New Issue](https://gits-15.sys.kth.se/inda-22/help/issues/new). Add a descriptive title, beginning with "Task *x*: *summary of problem here*"
3. Ask a TA in person during the [weekly lab](https://queue.csc.kth.se/Queue/INDA). Check your schedule to see when next lab is.

We encourage you to discuss with your course friends, but **do not share answers**!

### 🏛 Assignment

#### Exercise 6.0 -- What are the odds?

The Java [`Random` class](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/Random.html) provides a way to generate
random numbers. Before we start using it it's a good idea to read trough some documentation so that we know how it works.
Answer all the questions in the [docs/README.md](docs/README.md) file. You will need to refer to the
[documentation](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/Random.html) to be able to answer
the questions. If you are not familiar with it, you should also read the information about the _ternary operator_ below.

<details>
<summary> 📚 The ternary operator </summary>

The ternary operator is a compact `if`/`else`-statement. It is arguably quite hard to read and also referred to as the WTF-operator: `WHAT ? TRUE : FALSE`.
Have a look at the following code: 

```java
int value = random.nextInt(2) // Generate a random number that's either 0 or 1
// If value was 0, set valueWord to "zero", else, set it to "one"
String valueWord = (value == 0) ? "zero" : "one";
System.out.println("The generated value was " + valueWord);
```

The example is equivalent to:

```java
int value = random.nextInt(2); // Generate a random number that's either 0 or 1
String valueWord;
if (value == 0) {       // WHAT ?
    valueWord = "zero"; // TRUE
} else {                // :
    valueWord = "one";  // FALSE
}
System.out.println("The generated value was " + valueWord);
```

If you are in a bad mood, you can also nest these operators:
```java
int value = random.nextInt(9) // Generate a random number between 0 and 9
String valueWord = (value == 0) ? "zero" : (value == 1) ? "one" : (value == 2) ? "two" : "more than two";
System.out.println("The generated value was " + valueWord);
```

As you can see, deciphering exactly what the code does gets hard  *very* fast. 
You are free to use the ternary operator in your code, but in most cases we would recommend that you avoid it 
unless you are sure that your code will be made more understandable by using it. The primary reason for 
introducing it here is so that you will be familiar with it when you encounter it in someone else's code.

</details>

#### Exercise 6.1 -- Generating random numbers
Begin by creating a new java class called `RandomTester` in the [`src`](src) folder.
Your goal is to generate an `ArrayList` containing *n* random numbers. 
Create a method with the following header in your `RandomTester` class:
```java
public static ArrayList<Integer> generateNumbers(int n)
```
Test your method using JShell or the example main method below.

<details>
<summary> 🛠 Example main method </summary>

```java
    public static void main(String[] args) {
        // When declaring a constant, it is a convention to put the name in capital letters
        final int AMOUNT_OF_NUMBERS = 5;

        // Generate a list with five random numbers
        ArrayList<Integer> randomNumbers = generateNumbers(AMOUNT_OF_NUMBERS); 

        // Print the numbers
        // Every time you run this example, it should produce new numbers
        for (Integer number : randomNumbers) {
            System.out.println(number);
        }
    }
```
</details>

#### Exercise 6.2 -- Shuffle
Add a method in `RandomTester` that creates a _shuffled_, _deep copy_ of a provided  `ArrayList`.
The method should _not_ modify the list that is provided as an argument. Instead, create a new list that contains 
all the same elements as the original list in a random order. Your method must have the following header:
```java
public static ArrayList<Integer> shuffle(ArrayList<Integer> list)
```

<details>
<summary> 📚 Deep vs Shallow copy in Java </summary>

* **Deep copy**: a copy with completely new elements. Modifying the new list doesn’t alter the original list.
* **Shallow copy**: a copy that *points* to elements in the original list. The list elements are shared; altering the objects in the new list also modifies the original list. 

We will not go into the underlying mechanics on deep vs shallow copies in Java. The concept of [Pointers](https://en.wikipedia.org/wiki/Pointer_(computer_programming)) and [References](https://en.wikipedia.org/wiki/Reference_(computer_science)) will be introduced in later courses. If you want more explonations, we refer you to [this discussion](https://stackoverflow.com/questions/184710/what-is-the-difference-between-a-deep-copy-and-a-shallow-copy) on StackOverflow.

</details>

#### Exercise 6.3 -- Dice
Now you will model a six-sided dice. Make a new Java class called `Dice`. It should contain two fields; `int value` and `Random random`. 
When you create a new instance of the object, it should generate a new number between 1 and 6 and store it in the `value` field. You must also add a *getter* for the `value` field.

#### Exercise 6.4 -- Sequence of dice (`RandomTester.java`)
Make a method that stores `n` rolled dice in an array. It must have the following header:

```java
    public static ArrayList<Dice> sequenceOfDice(int n)
```

Add this method to the `RandomTester.java` file.

#### Exercise 6.5 -- Highest adjacent rolls
Add a method to your `RandomTester` class that takes a sequence of dice rolls and returns the sum of the two adjacent 
(sv: *intilliggande*) rolls that has the *highest* value. 
It must have the following header:

```java
    public static int highestAdjacentRolls(ArrayList<Dice> sequence)
```

If you have four rolls `{1, 1, 1, 2}`, the method should return `3`, since the sum of element 3 and 4 is `1 + 2 = 3`.


#### Exercise 6.5 -- Smallest adjacent rolls
Add a method to `RandomTester.java` that takes a sequence of dice rolls and returns the sum of the two adjacent rolls 
that has the *smallest* value. It must have the following header:

```java
    public static int smallestAdjacentRolls(ArrayList<Dice> sequence)
```

If you have four rolls `{1, 1, 1, 2}`, the method should return `2`, since the sum of element 1 and 2 (or 2 and 3) is `1 + 1 = 2`.

#### Exercise 6.6 -- Biased Dice
Create a new class called `BiasedDice`, that has a probability of 50% to return 6, and otherwise an equal chance of returning 1-5. 

Since you already have a `Dice` class with a getter, you could *reuse* that implementation by *extending* the `BiasedDice`:

```java
public class BiasedDice extends Dice { // New keyword: 'extends'
    // Class code goes here
}
```

When you extend the `Dice` class, the `BiasedDice` inherits all the fields and methods you implemented in `Dice`! Thus, all you have to add to the `BiasedDice` class is a constructor. 
You can still use the `getValue()` method on your `BiasedDice` objects.
However, in order to use the inherited *members* (fields and methods) of a class, they can not be set to `private`. 
Instead, you can set the fields and methods to `protected`, which means that they are only accessible to the class itself 
and all classes that extends it.
This concept of building a class on top of another is called *inheritance* and is a core principle of object-oriented programming.

> **Assistant's note:** [Inheritance](https://en.wikipedia.org/wiki/Inheritance_(object-oriented_programming)) will be thoroughly explained as you progress in your studies. For now, you are not required to use `extends`. If you want to annoy your TA, it is possible to assign the `value` using a ternary operator. You could also use `if` / `else` statements.

#### Exercise 6.7 -- Remove dice from a sequence
Make a method in `RandomTester.java` that returns an ArrayList with all dice of value *n* removed from a sequence. It must have the following header:

```java
public static ArrayList<Dice> remove(ArrayList<Dice> sequence, int n)
```

Removing objects from an ArrayList while you iterate over it can lead to problems, but you can overcome this 
with the use of an [Iterator](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/Iterator.html).
You can find how to get an iterator from an `ArrayList` in the [documentation](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/ArrayList.html).
Since you are not supposed to modify the contents of the `sequence` ArrayList, you will need to create a copy of it inside `remove`. Then get the iterator from the copy, and remove the elements from the copy. Finally, return the copy.
You can read more about iterators below.

<details>
<summary> 📚 The Iterator </summary>

An `Iterator` can be used to iterate over the underlying _iterable_ collection, e.g., an ArrayList.
Its API is quite self-explanatory:

```java
Iterator<Integer> iterator = integerList.iterator();
while (iterator.hasNext()) {
    Integer number = iterator.next();
    System.out.println(number);
}
```

_"But what is the difference between an iterator and a for-each loop?"_, I hear you ask.
The iterator is a bit more flexible, since you can remove elements from the collection while iterating over it.

Try executing the following code:
```java
ArrayList<Integer> integerList = new ArrayList<>();
integerList.add(1);
integerList.add(2);
integerList.add(3);
for (Integer number : integerList) {
    if (number == 2) {
        integerList.remove(number);
    }
}
```
You will get a `ConcurrentModificationException`. To avoid this, you can use an iterator to remove elements from the collection while iterating over it:
```java
ArrayList<Integer> integerList = new ArrayList<>();
integerList.add(1);
integerList.add(2);
integerList.add(3);
Iterator<Integer> iterator = integerList.iterator();
while (iterator.hasNext()) {
    Integer number = iterator.next();
    if (number == 2) {
        iterator.remove();
    }
}
```

</details>


#### Exercise 6.8 -- `Dice@7e9e5f8a`???
The following code generates a new set of dice and print them to the terminal:

```java
public static void main(String[] args) {
    // A constant signifying how many dice you want
    int NUMBER_OF_DICE = 5;

    // Generate a new sequence with 10 dice
    ArrayList<Dice> sequence = sequenceOfDice(NUMBER_OF_DICE);

    for(int i = 0; i < sequence.size(); i++) {
        System.out.println("Dice " + (i + 1) + ": " + sequence.get(i));
    }
}
```

However, instead of showing what each roll contains, it produces something like: 

```bash
Dice 1: Dice@7344699f # I want this to be the value of the current Dice :(
Dice 2: Dice@6b95977
Dice 3: Dice@7e9e5f8a
Dice 4: Dice@8bcc55f
Dice 5: Dice@58644d46
```

Find a way to change the `Dice` class so that the actual value of each `Dice` is printed instead. 
You are not allowed to make any changes to the `main` method above. 

> **Assistant's note:** You might want to use the `String` class and the method [valueOf](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/lang/String.html) for this purpose. Remember that in order to call a static method from another class, you have to Type `ClassName.method()`. You did this in previous exercises with the math library, for example, `Math.sqrt()`.

### File Input / Output (IO)

Now you will create a dice throwing simulator that stores the values of the
thrown dice to a file.

Java provides many, many ways of creating and writing to files. For this
exercise, you will be using the
[FileWriter](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/io/FileWriter.html)
class. Before diving in to solving the exercises, read the following
introduction to _exceptions_.

<details>
<summary> 📚 Introduction to exceptions</summary>

As you can see in the [documentation](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/io/FileWriter.html#%3Cinit%3E(java.io.File,boolean)), the constructors for the `FileWriter` class have the words `throws IOException` next to them, like so: 

```java
public FileWriter(String fileName, boolean append) throws IOException                                                 
```

Exceptions are the preferred way of handling errors in Java. The `FileWriter`
constructor throws an
[`IOException`](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/io/IOException.html)
because there might occur an error pertaining to I/O (short for Input / Output)
when executing the constructor. For example, the user running the Java program
might lack permission to create files in the directory that the constructor
tries to create a file in. This will cause the constructor to be unable to
create the required file. It will then throw an `IOException`.

An unhandled exception will crash the program and print some
debugging information to the terminal. While drastic, this is sometimes exactly
what you want. Some kind of errors are difficult or impossible to recover from.
But you can also _catch_ an exception, which will prevent it from crashing the
program, and allows you as a programmer to handle the error in a more graceful
way. The syntax is similar to `if`/`else` statements, and looks like the following:

```java
try {
    // Here is code that may or may not throw an exception
    FileWriter writer = new FileWriter("foo.txt", true);
} catch (IOException theException) { // Here you specify the type of exception that you want to catch
    // If any of the lines above throw an IOException, this block of code will be executed
    System.out.println("Unable to open the file 'foo.txt'");
    System.out.println("Please make sure that you have the correct permissions, and then try again!");
}
```

There are different types of exceptions, and some exceptions _must_ be caught,
while others are less restrictive. This is only meant as a brief overview. For
further reading, check out Oracle's excellent
[tutorial](https://docs.oracle.com/javase/tutorial/essential/exceptions/runtime.html)
</details>

#### Exercise 6.9 -- The `DiceGame` class

Create a class called `DiceGame`. Give it a field called `writer` of type
[FileWriter](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/io/FileWriter.html).
Create a constructor for the class that takes no arguments. In the constructor,
instantiate `writer` to a `FileWriter` object using the
[FileWriter(String fileName, boolean append)](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/io/FileWriter.html#%3Cinit%3E(java.io.File,boolean))
constructor. This `writer` should be set up to write to a file called
`dicethrows.txt` in append mode.

As a final step, wrap this instantiation in a `try-catch` block. If an
`IOException` is thrown, print an error message to the terminal.

> **Assistant's note:** If the FileWriter is not in append mode, any existing
> contents of the file will be overwritten on each write. Take a look at the [documentation](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/io/FileWriter.html#%3Cinit%3E(java.io.File,boolean)) if you feel unsure about how to achieve this.

#### Exercise 6.10 -- Throwing dice

Add a method with the header
```java
public void throwDice(String username, int numDice) 
```
to the `DiceGame` class. This method should use the
[write](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/io/Writer.html#write(java.lang.String))
method of the `writer` you created in the previous task to write the `username`
argument, followed by `numDice` dice throws separated by spaces, followed by a
newline, to the output file.

The following invocation:
```java
throwDice("Ansgar", 4);
```
appends a line looking like this to 'dicethrows.txt':
```
Ansgar 2 3 1 2
```

As you can see in the documentation for `write`, it also throws an
`IOException`. Handle this like you did in the last exercise, with a `try-catch`
block and a suitable error message.

> **Assistant's note:** A newline is represented by the escape sequence `\n`.
> This means that the following method calls give the same output:
> `System.out.println("Yowza!")` = `System.out.print("Yowza!\n")`

#### Exercise 6.11 -- Playing from the terminal
Let's make it possible to play a dice game directly from the terminal. In order to do this, we will 
need to provide some data to our program about who is playing and how many dice we want to throw.
You can read more about how to do this below.

<details>
<summary> 📚 Passing arguments to a main method </summary>

You have come across the `main` method before. You may have wondered about its
rather long header: `public static void main(String[] args)`. That's a mouthful!
There is a reason for each of those words, however, and now you will get
familiar with the `String[] args` part.

Normally, a Java program is invoked from the command line by writing `java`
followed by the name  of the program, and then hitting enter, like  so:

```
$ java MyProgram
```

You also have the option of writing more words after the name of the program.
Each extra word, delimited by whitespace, automatically becomes an element in
the `args` array.

Thus, if you have the following program:

```java
public class Parrot {
    public static void main(String[] args) {
        for (int i = 0; i < args.length; i++) {
            System.out.println("Argument " + i + ": " + args[i]);
        }
    }
}
```

And you invoke it like this:

```
$ java Parrot i am a little bird
```

Then the output will be:

```
Argument 0: i
Argument 1: am
Argument 2: a
Argument 3: little
Argument 4: bird
```
---

</details>

Add a `main` method in the `DiceGame` class. In it, instantiate a new
`DiceGame` object. We will require the first element of the `args` array in `main` to be the username, and 
the second element of the `args` array be the number of dice throws. Call the `throwDice` method using these as
arguments. You will need to convert the number of throws (which will be `String`) 
into an integer first. This can be done using the
[Integer.parseInt](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/lang/Integer.html#parseInt(java.lang.String))
method.

You can assume that the input is well formed: you don't have to check that the
number of arguments are correct, or that the integer string actually can be
parsed.

#### Exercise 6.12 -- Don't forget to flush!

Run the program and roll some dice! Notice that the `dicegame.txt` file is
created in the directory in which you run the program. But something is wrong!
The file is, most likely, empty.

You will need to
[`flush`](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/io/Writer.html#flush())
the `FileWriter` in order to make sure that the written contents actually are
stored on file. This may look a bit weird and cumbersome, but it is done for
performance reasons. For now, you can just accept it as something that has to be
done and not worry too much about it.

Add an invocation of
[`flush`](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/io/Writer.html#flush())
to the `throwDice` method you wrote in task 6.9. Then try to roll some dice
again, and make sure that it works as intended by inspecting the
`dicethrows.txt` file.

### Bugs and errors?
If you find any inconsistencies or errors in this exercise, please open a [New Issue](https://gits-15.sys.kth.se/inda-22/help/issues/new) with the title "Task *x* Error: *summary of error here*". Found bugs will be rewarded by mentions in the acknowledgment section.

### Acknowledgment
This task was designed by                <br>
[Linus Östlund](mailto:linusost@kth.se)  <br>
[Sofia Bobadilla](mailto:sofbob@kth.se)  <br>
[Gabriel Skoglund](mailto:gabsko@kth.se) <br>
[Arvid Siberov](mailto:asiberov@kth.se)  <br>
