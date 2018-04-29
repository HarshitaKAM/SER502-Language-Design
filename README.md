# SER 502 Compiler Design Project

This repository contains the compiler design project for Team 18 for SER 502 at Arizona State University in the Spring 2018 semester.

## Team Members

Melissa Day

Sowmya Madabhushi

Behnaz Sabbaghi

Harshita Kajal

## Language Information

The language is called Habesome. It was developed in Prolog.

## Video Link

Video presentation can be viewed at: https://youtu.be/2LtqRqBYfpw


## Repository structure

src/ - Includes compiler and runtime subdirectories containing the sourcecode

src/compiler - Contains the source code to run the compiler. All components are contained in a single file called "Team18"

src/runtime - Contains a file to generate parse trees

data/ - Contains 5 sample programs with their corresponding parse trees

doc/ - Contains the Ppt presentation, contribution file

## Getting Started

Download the file called "Team18.pl" to your local machine.

### Prerequisites

Requires SWI Prolog to be installed on the computer


### Build & Run

To run the code written in Habesome, save it as a file with a ".hbsm" extension.
(If you are unable to save it as a ".hbsm" file, you can also save it as a ".txt" file, and it should function the same.)


#### For Windows

Open a command prompt and navigate to the folder containing the "Team18.pl" file.
In the command prompt terminal, type the following, which will launch the Prolog terminal:
```
"Team18.pl"
```

In the Prolog terminal, type:

```
main("InputFilename.hbsm", Output).
```

This will build and run the compiler and save the parse tree and program output to a newly created file called "ProgramOutput.txt".
(Note that running multiple times with the same command will overwrite the contents of the output file.)
The output will also be displayed on the terminal.

#### For Mac

Testing was completed on a Windows machine. For Mac and Linux, the process should be similar.

## Running the tests

To run the test cases, execute the program multiple times with the following commands given to the Prolog terminal:

```
main("Test1.hbsm", Output).
main("Test2.hbsm", Output).
main("Test3.hbsm", Output).
main("Test4.hbsm", Output).
main("Test5.hbsm", Output).
```

Remember: After each test, view the output file called "ProgramOutput.txt" before running the next test. Running the tests successively will overwrite the previous contents of the output file.

## Project Notes
### Required Items Completed

The following items are tested and working as expected:
#### Arithmetic Operators: Multiplication and Addition
#### If statements
#### Variable assignment for single letter variable names
#### Single digit numbers

### Required Items Partially Implemented in Interpreter

The following items function in our grammar and parser, but were not implemented in our compiler. Since we know how to implement them, we are providing an explanation of that, as we did not have time to get them fully functioning.
#### While Loops
Since if statements are implemented, a while loop will be similar except the final environment will change each time. The interpreter would need to update the value of the variable for the condition after executing the block, which will produce a new environment. The new environment would be compared to a "target environment" that has the ending condition for the loop. Once the statement in the interpreter reaches the target environment, the statement should become false, thus ending the loop.
#### Int and bool declarations
These simply need to consume the keyword 'int' and 'bool' from our parse tree, then continue with statement execution. This would make our variables statically typed. In order to support dynamic typing, we would need to modify our update statement in the interpreter to give a tuple, instead of a pair. Each element would then contain a type, variable name, and value.
#### Multi-letter variable names
In order to support these, we need to chain our evalI statements with another statement that processes each letter received as a token, then concatenates these together. The multi-letter name would the nbe treated as a single variable name.
#### Boolean expressions(less,greater than, logical not, comparator, etc.)
Implementing these in the interpreter would require adding statements that first compute the value if two different expressions. Next, it would evaluate whether one statement was greater/less than/equal, etc. to another. Since it in Prolog, we only need to account for when the statement is TRUE. If it is false, our rule for "<<", for example, will fail. The value "true" would be assigned to that statement, but would not change the environment. If it succeeds, then it can continue with the if statement.
#### If-else
Functions with an if statement with a "true" command as input. (Else is in grammar and parser, but not implemented in interpreter.) Implementing else would require adding an additional rule after the rule for if. If the "if" fails, then execution would continue with the else, and the block in the else statement would be executed, changing the environment.


### Extra Items Completed (Beyond project requirements)

#### Prolog tokenizer from scratch
We did not use any tools for the tokenizing of our language. We wrote the code in Prolog to tokenize our input.
#### Nested blocks
Our interpreter supports successive block statements, as well as nested block statements.
#### Left-associativity and Operator precedence
Our language is left associative and follows the conventional rules of mathematics for operator precedence (e.g., multiplication before addition)
#### Multiple, successive statements
Our language supports statements that are listed successively. Various combinations of our functioning portions can be implemented to achieve the expected output.
#### Multi-digit numbers
Numbers with two or more digits work in the interpreter and are evaluated correctly. However, our tokenizer delimits on spaces, so numbers with two or more digits are tokenized correctly. Thus, we are unable to provide these in our test programs. In order to support these, we would need to update how the tokenizer delimits, using a function called "look ahead" to determine if the next token is a number or letter. Based on this, it could tokenize correctly.
Work in interpreter, but tokenizer delimiting does not support multi-digit numbers.


### Known Bugs
#### Tokenizer delimiting
Currently, the tokenizer delimits on spaces, so there must be a space after each input token as shown in the sample programs. In order to fix this, we would need to update how the delimiting function of the tokenizing as described above.


## Team Working Notes

Originally, we began as a team of 4. After some discussion, we decided to develop our compiler in Prolog, as we were most comfortable with this language. Since one of our team members did not feel confident in Prolog, she chose not to contribute any code to the project or participate in the video. Thus, we are a team of 3, so we have been more limited in our allocated resources for this project than a team of 4. We have included the name of the fourth team member on our documentation. However, she, ultimately, did not participate in Milestone 3 of the project, although we attempted to contact her, include her in planning sessions, find a compromise, etc.
