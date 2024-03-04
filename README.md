# protal_app

## Overview

This project is designed as a practical introduction to developing with Flutter, focusing on creating a news application. It showcases Flutter's capabilities for crafting beautiful, natively compiled applications from a single codebase for mobile, web, and desktop.


## หลักการทำงานของ App
```mermaid
graph TD;
    main["main.dart - Entry Point"] -->|Initializes| homepage["homepage.dart - Home Page"];
    main -->|Defines Routes| loginScreen["loginScreen.dart - Login Screen"];
    main --> splash_screen["splash_screen.dart - Splash Screen"];
    main --> newsdetails["newsdetails.dart - News Details Page"];
    
    homepage -->|Uses| news_card["news_card.dart - News Card Component"];
    homepage -->|Fetches Data Through| newsService["newsservices.dart - News Services"];
    
    newsdetails -->|Displays Detailed Info| newsModel["newsmodel.dart - News Model"];
    
    newsService -->|Utilizes| newsModel;
    newsService -->|Interacts With| newsViewModel["newsviewmodel.dart - News ViewModel"];
    
    newsViewModel -->|Manages State & Logic| newsModel;
    homepage -->|Navigation Drawer| drawer["drawer.dart - Drawer Component"];
    
    classDef file fill:#f9f,stroke:#333,stroke-width:2px;
    class main,homepage,loginScreen,splash_screen,newsdetails,news_card,newsModel,newsService,newsViewModel,drawer file;
```

## Folder Structure

```
lib/
|- components/           # Reusable UI components (e.g., NewsCard, Drawer)
|- Model/                # Data model classes
|- Pages/                # Screens/pages of the app (e.g., HomePage, LoginScreen)
|- services/             # Classes for handling external services (APIs)
|- utils/                # Utility functions or classes
|- viewmodel/            # View model classes for business logic
|- main.dart             # Entry point of the application
```

## Key Components

- **main.dart**: The starting point of the application, setting up the MaterialApp and the initial route.
- **components/**: Contains reusable UI components like `NewsCard` for displaying news articles and a custom `Drawer` for navigation.
- **Model/**: Defines the structure for the data used within the app, such as news articles.
- **Pages/**: Hosts the various screens of the application, including the home page, login screen, and details pages for news articles.
- **services/**: Includes services for fetching data from external sources, demonstrating how to integrate APIs.
- **utils/**: Utility classes or functions that provide common functionality throughout the app.
- **viewmodel/**: Contains the business logic of the application, separating the UI from the core logic.

## Getting Started

To get started with this project:

1. Ensure you have Flutter installed on your machine.
2. Clone this repository to your local machine.
3. Open a terminal in the project directory and run `flutter pub get` to install dependencies.
4. Run `flutter run` to start the app on a connected device or emulator.

## what's inside?

This is the project to show basic widget information about flutter application

- Splash Screen 
![alt text](img/Screenshot_1709196266.png)
_ Login Form
![alt text](img/Screenshot_1709196272.png)
-Form validation
![alt text](img/Screenshot_1709196334.png)
-Fetching data from json file in card
![alt text](img/Screenshot_1709196363.png)
- Showing news in details page and star logic implimented
![alt text](img/Screenshot_1709196437.png)
- Suggestion Page
![alt text](<img/Screenshot 2024-03-04 091136.png>)
- Profile Page
![alt text](<img/Screenshot 2024-03-04 091515.png>)