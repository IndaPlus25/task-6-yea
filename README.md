# Roll the dice 🎲

Last week’s exercises introduced the concept of iteration and collections. You have learned about looping using `for`, `while`, and `foreach`. In this exercise, you will learn about the [`Random` class](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/Random.html).

### 💀 Deadline

This work should be completed before the exercise, on **Friday 11 October** depending on your group.

### 👩‍🏫 Instructions

For instructions on how to do and submit the assignment, please see the
[assignments section of the course instructions](https://gits-15.sys.kth.se/inda-24/course-instructions#assignments).

### 📝 Preparation

- Review the [lecture slides](https://docs.google.com/presentation/d/1EDtEsIGfYasa1pMqaGSxSXVIDIO-KDesav8p_EnGLlk/edit#slide=id.p)
- Read and answer all questions in [Module 7: Documentation](https://qbl.sys.kth.se/sections/dd1337_programming/container/documentation)

### ✅ Learning Goals

This week's learning goals include:

1. Understanding the Java `Random` object
2. Understanding the [ternary operator](https://en.wikipedia.org/wiki/%3F:#Java)
3. Know the difference between a deep and a shallow copy
4. Finding and fixing bugs
5. Using an Iterator to modify a collection during iteration
6. **Optional**: Using inheritance to avoid code duplication 

### 🚨 Troubleshooting Guide

If you have any questions or problems, follow this procedure: <br/>

1. Look at this week's [posted issues](https://gits-15.sys.kth.se/inda-24/help/issues). Are other students asking about your problem?
2. If not, post a question yourself by creating a [New Issue](https://gits-15.sys.kth.se/inda-24/help/issues/new). Add a descriptive title, beginning with "Task *x*: *summary of problem here*"
3. Ask a TA in person during the [weekly lab](https://queue.csc.kth.se/Queue/INDA). Check your schedule to see when the next lab is.

We encourage you to discuss with your course friends, **but do not share answers!** Similarily, use of any AI services 🤖 are great to help explain things, **but please do not submit AI-generated solutions** - you must be both responsible for your own solutions and must be able to explain them under examination.

### 🏛 Assignment

#### Exercise 6.0 -- What are the odds?

The Java [`Random` class](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/Random.html) provides a way to generate
random numbers. Before we start using it it's a good idea to read through some documentation so that we know how it works.
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
Begin by creating a new Java class called `RandomTester` in the [`src`](src) folder.
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

        // Generate a list with random numbers
        ArrayList<Integer> randomNumbers = generateNumbers(AMOUNT_OF_NUMBERS); 

        // Print the numbers
        // Every time you run this example, it should produce new numbers
	System.out.println("The following " + AMOUNT_OF_NUMBERS + " numbers were generated:");
        for (Integer number : randomNumbers) {
            System.out.println(number);
        }
    }
```
</details>

#### Exercise 6.2 -- Shuffle
Add a method in `RandomTester` that creates a _shuffled_, _deep copy_ of a provided  `ArrayList`.
The method should _not_ modify the list that is provided as an argument. Instead, create a new list that contains 
all the same elements as the original list in random order. Your method must have the following header:
```java
public static ArrayList<Integer> shuffle(ArrayList<Integer> list)
```

<details>
	
<summary> 📚 Deep vs Shallow copy in Java </summary>

* **Deep copy**: a copy with completely new elements. Modifying the new list doesn’t alter the original list.
* **Shallow copy**: a copy that *points* to elements in the original list. The list elements are shared; altering the objects in the new list also modifies the original list. 

We will not go into the underlying mechanics of deep vs shallow copies in Java. The concept of [Pointers](https://en.wikipedia.org/wiki/Pointer_(computer_programming)) and [References](https://en.wikipedia.org/wiki/Reference_(computer_science)) will be introduced in later courses. If you want more explanations, we refer you to [this discussion](https://stackoverflow.com/questions/184710/what-is-the-difference-between-a-deep-copy-and-a-shallow-copy) on StackOverflow.

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
To check this we must test all adjacent pairs. If we for example have five rolls `{1, 1, 2, 1, 5}`, we should check the following cases:

- `1 + 1 = 2`
- `1 + 2 = 3`
- `2 + 1 = 3`
- `1 + 5 = 6`

Here we can see that the last adjacent pair of dice (the last two elements) have the highest sum, and the method should therefore return `6`. 

Similarly, the method should return `10` if you have 7 rolls `{6, 1, 5, 5, 4, 3, 2}` since the highest sum of two adjacent dice is `5 + 5 = 10`. It does not matter if the sum occurs multiple times.

#### Exercise 6.6 -- Smallest adjacent rolls
Add a method to `RandomTester.java` that takes a sequence of dice rolls and returns the sum of the two adjacent rolls 
that have the *smallest* value. It must have the following header:

```java
    public static int smallestAdjacentRolls(ArrayList<Dice> sequence)
```

If you have five rolls `{1, 1, 2, 1, 5}`, the method should return `2` since the sum of the two smalles adjacent elements are `1 + 1 = 2`.

#### Exercise 6.7 -- Biased Dice
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
and all classes that extend it.
This concept of building a class on top of another is called *inheritance* and is a core principle of object-oriented programming.

> **Assistant's note:** [Inheritance](https://en.wikipedia.org/wiki/Inheritance_(object-oriented_programming)) will be thoroughly explained as you progress in your studies. For now, you are not required to use `extends`. If you want to annoy your TA, it is possible to assign the `value` using a ternary operator. You could also use `if` / `else` statements.

#### Exercise 6.8 -- Remove dice from a sequence
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
The iterator is a bit more flexible since you can remove elements from the collection while iterating over it.

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


#### Exercise 6.9 -- `Dice@7e9e5f8a`???
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
The output is from the the default [toString method in Object](https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html#toString()) which prints the name of the class and a hexadecimal hash value.

Define your own toString method (which overrides the default toString) in the `Dice` class so that the actual value of each `Dice` is printed instead. 

> **Assistant's note:** You need to return a String, not an int. Use [String.valueOf](https://docs.oracle.com/javase/7/docs/api/java/lang/String.html#valueOf(int)).

### ❎ Checklist 
- [ ] Answer all questions in [docs/README.md](docs/README.md)
- [ ] Create a Java class called `RandomTester` in the [`src`](src) folder containing the following methods:
	- [ ] `public static ArrayList<Integer> generateNumbers(int n)` 
	- [ ] `public static ArrayList<Integer> shuffle(ArrayList<Integer> list)` make sure you use a deep copy.
	- [ ] `public static ArrayList<Dice> sequenceOfDice(int n)`
	- [ ] `public static int highestAdjacentRolls(ArrayList<Dice> sequence)`
	- [ ] `public static int smallestAdjacentRolls(ArrayList<Dice> sequence)`
	- [ ] `public static ArrayList<Dice> remove(ArrayList<Dice> sequence, int n)`
- [ ] Make a Java class called `Dice`. 
	- [ ] Add two fields; `int value` and `Random random`. 
	- [ ] Make it so that it generates a new number between 1 and 6 and store it in the `value` field on creation. 
	- [ ] Add a *getter* for the `value` field.
	- [ ] Define your own toString method that prints actual value of each `Dice`. 
- [ ] Create a class called `BiasedDice`, that *extends* the `Dice` class.
	- [ ] It should have a 50% chance to return 6, and otherwise an equal chance of returning a number 1-5. 

> **Assistant's note:** We have added this checklist for you to make a final check before handing in your work. You don't have to tick the boxes unless you want to (to tick a box, place an "x" within the brackets when editing the README.md)
	
### 🐞 Bugs and errors?
If you find any inconsistencies or errors in this exercise, please open a [New Issue](https://gits-15.sys.kth.se/inda-24/help/issues/new) with the title "Task *x* Error: *summary of error here*". Found bugs will be rewarded by mentions in the acknowledgment section.

### 🙏 Acknowledgment
This task was designed by                <br>
[Linus Östlund](mailto:linusost@kth.se)  <br>
[Sofia Bobadilla](mailto:sofbob@kth.se)  <br>
[Gabriel Skoglund](mailto:gabsko@kth.se) <br>
[Arvid Siberov](mailto:asiberov@kth.se)  <br>
[Alexander Runebou](mailto:alerun@kth.se)<br>

Proofreading & Bug fixes by <br>
[Alexander Jastrzebski]()   <br>
[Karl Walfridson]()         <br>
