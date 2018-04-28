# SER 502 Compiler Design Project

This repository contains the compiler design project for Team 18 for SER 502 at Arizona State University in the Spring 2018 semester.

Team Members:
Melissa Day
Sowmya Madabhushi
Behnaz Sabbaghi
Harshita Kajal

The language is called Habesome.
Video presentation can be viewed at: [link to video].

The repository structure is:
src/ - Includes compiler and runtime subdirectories containing the sourcecode
src/compiler - Contains the source code to run the compiler. All components are contained in a single file called "Team18"
src/runtime - Contains a file to generate parse trees

## Getting Started

Download the file called "Team18.pl" to your local machine.

### Prerequisites

Requires SWI Prolog to be installed on the computer


### Build & Run

To run the code written in Habesome, save it as a file with a ".hbsm" extension.

For Windows: 
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

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

To run the test cases, execute the program multiple times with the following commands:

```
main("Test1.hbsm", Output).
main("Test2.hbsm", Output).
main("Test3.hbsm", Output).
main("Test4.hbsm", Output).
main("Test5.hbsm", Output).
```

Remember: After each test, view the output file called "ProgramOutput.txt" before running the next test. Running the tests successively will overwrite the previous contents of the output file.

## Project Notes
### Items Completed

The following items are tested and working as expected:
#### Arithmetic Operators: Multiplication and Addition
#### If statements
#### Variable assignment

### Required Items Not Implemented in Interpreter

The following items function in our grammar and parser, but were not implemented in our compiler. Since we know how to implement them, we are providing an explanation of that, as we did not have time to get them fully functioning.
#### While Loops
#### Int and bool declarations
#### Multi-letter variable names
#### Boolean expressions
less/greater than, logical not, comparator, etc.)

### Extra Items Completed (Beyond project requirements)

The following items are tested and working as expected:
Arithmetic Operators: Multiplication and Addition
If statements
Variable assignment

```
Give an example
```

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc
