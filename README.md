# Posts-app-tdd-clean-archi

Posts-app  Application created with flutter by using TDD Clean Architecture with Bloc.

### Libraries & Tools Used

* bloc: ^8.1.2
* flutter_bloc: ^8.1.3
* dio: ^5.4.0
* go_router: ^12.1.3
* dartz: ^0.10.1
* equatable: ^2.0.5
* connectivity: ^3.0.6
* flutter_gen: ^5.4.0
* flutter_screenutil: ^5.9.0
* lottie: ^3.0.0
* bloc_test: ^9.1.5
* mocktail: ^1.0.2
* flutter_gen_runner: ^5.4.0
* very_good_analysis: ^5.1.0
* get_it: ^7.6.6
* json_annotation: ^4.8.1
* json_serializable: ^6.7.1
* build_runner: ^2.4.8

### Folder Structure
Here is the core folder structure.

```
flutter-app/
|- android
|- assets
|- build
|- ios
|- lib
|- modules
|- test
```

Here is the lib folder structure I have been using in this project

```
lib/
|- app/
|- feature/
|- gen/
|- product/
|- main.dart
```
Here is the modules folder structure which includes packages

```
modules/
|- core/
|- injection_container/
|- posts_data/
|- posts_domain/
|- test/
```

Now, lets dive into the modukes folder which has the main packages for the application.

```
1- core - Contains the business independent structures of the project.
2- injection_container - handle project's dependency with get_it
3- posts_data - Contains the data layer of my project (model, data_source, repository) 
4- posts_domain - Contains the domain layer of my project (entity, repository, usecase)
```

## Conclusion
The aim of this project is to use tdd clean architecture with bloc and write unit tests.
I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the boilerplate then please feel free to submit an issue and/or pull request :)


