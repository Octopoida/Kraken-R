# R Coding Principles

## 1. Coding Style
- Use a standardized style guide for the code language
	- [Prettier](https://prettier.io/) -- [VSCode](https://github.com/prettier/prettier-vscode)
	- [R Style Guide by Hadley Wickem](http://adv-r.had.co.nz/Style.html)
	- [Tidyverse style guide](https://style.tidyverse.org/)
	- [Google R Style Guide](https://google.github.io/styleguide/Rguide.html)
	- [Black](https://black.readthedocs.io/en/stable/the_black_code_style/index.html) -- Python

## 2. Comments and Documentation
- Comments = the Why, while code = the how.
- Provide extra context to code chunks.
- Good comments reduce onboarding time and prevent misinterpretation during maintenance.

## 3. Robustness
- Handled unexpected situations without breaking.
- Adding proper error handling to prevent crashes.
- [Defensive Programming in R, by Chris von Csefalvay](https://www.r-bloggers.com/2018/07/the-ten-rules-of-defensive-programming-in-r/)
- S Single Responsiblity Principle (SRP)
	- A class should have only one reason to change—meaning it should have one job or responsibility. Each class should focus on a single task or concern (e.g., data storage, business logic, UI rendering). If a class handles multiple unrelated duties, changes to one duty could break the others, increasing bugs and complexity.
- O Open/Close (OCP)
	- Software entities (classes, modules, functions) should be open for extension but closed for modification. You should extend functionality by adding new code (e.g., subclasses, plugins) rather than altering existing, tested code. This reduces risk and preserves stability.
- L Liskov Substituion Principle (LSP)
	- Subtypes must be substitutable for their base types without altering the program’s correctness. If a class S inherits from T, you should be able to use S anywhere T is expected, and the program should still work as intended. This ensures inheritance respects the contract of the parent.
- I Interface Segregation Principle (ISP)
	- Clients should not be forced to depend on interfaces they don’t use. Keep interfaces (or abstract classes) small and specific, so implementing classes only deal with methods relevant to their role. Avoid fat, general-purpose interfaces.
- D Dependency Inversion Principle (DIP)
	- High-level modules should not depend on low-level modules—both should depend on abstractions. Abstractions should not depend on details; details should depend on abstractions. Invert the dependency flow by using interfaces or abstract classes, decoupling high-level logic (e.g., business rules) from low-level implementations (e.g., database access). This is often paired with dependency injection.

SRP: One job per class (e.g., User vs. UserRepository).

OCP: Extend without modifying (e.g., new Shape types).

LSP: Subtypes behave like their parents (e.g., FlyingBird vs. Penguin).

ISP: Small, relevant interfaces (e.g., Workable vs. Eatable).

DIP: Depend on abstractions (e.g., Storage in UserService).


## 4. Testing
- Make testing easy to do.

## 4. Abstraction
- Abstract at high level, then code the specifics.

## 5. Design Patterns
- Focus on simple solutions.
- Model-View-Controller (MVC) patterns

(model data, View is presentation,  controller is user interaction)

	- Factory pattern
	- Facade pattern
	- Singleton pattern
	- State pattern

- Creational Patterns
	- How objects are created
		-  Singleton pattern
		- Prototype pattern - Clone
		- Builder pattern
		- Factory pattern
		
- Structural patterns
	- How objects relate to each other.
		- Facade pattern (simple API in code)
		- Proxy (substitute)
		
- Behavioral patterns
	- How objects interact/communicate with each other
		- Iterator pattern (traverse a collection of objects)
			- FOR LOOP
			- Pull based system
		- Observer
			- Push based system (subscribe to object events -- one-to-many)
		
## 6. Reduce Global Dependencies
- global variables can lead to spegetti code.
- global varaibles make it hard to track down bugs.
- Use local state and pass parameters.

## 7. Continuous Refactoring
- coding is an iterative process.
- complexity
- poor naming

## 8. Security

