# CreditScore

## Table of contents
* [Introduction](#introduction)
* [Features](#features)
* [Software And Technologies](#software-and-technologies)
* [Setup](#setup)
* [Approach](#approach)
* [Code Structure And Design Pattern](#code-structure-and-design-pattern)
* [Unit Testing](#unit-testing)
* [Future Features And Improvements](#future-features-and-improvements)
* [Application Screens](#application-screens)

## Introduction:
iOS application to display a donut view which pulls the **Credit Score** information from the given endpoint, built with combination of Swift, SwiftUI.
The donut displays the credit score value received from the endpoint.

## Features:
1.  Consumption of API (https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values) to fetch the credit score report. (URL Session,Codable)
2.  Create Donut view to display the score report fetched from API. (SwiftUI)
3.  Fetch credit score report, calculate user credit score percentage value to show the donut progress bar. (SwiftUI)
4.  Error handling throughout the application.
5.  Unit Testing and UI Testing using XCTest framework.
6.  Dark mode support.

## Software And Technologies:
* MacOS : Big Sur (11.0.1)
* Xcode: 12.3
* Minimum iOS version: 14.0
* Swift: 5
* SwiftUI

## Setup:
To run this project, open the ClearScore.xcodeproj in Xcode and you should be able to run it on the desired simulator without any changes(iPhone).
You will need to configure your development team in the app target's **"Signing & Capabilities"** tab in order to run it on real device.

## Approach:
1.  On the launch of the app, fetch the user credit score report from API endpoint, using **URL Session** data task.
2.  Create the credit score Json object from API response data using **JSONDecoder**.
3.  Use **SwiftUI** to show the credit score on a donut view.
4.  Show donut progress bar by calculating the percentage of credit score out of total score.
6.  Show Errors using **Alert view** appropriately.
7.  **Protocols-Delegates**: Used protocols for notifying the controller about score data availability and errors if any.
8.  **Enum**: Used with **Tuple** cases, **generic** type for Success and Failure conditions.
9.  **Extensions**: Used for adding more functionality to class and modularizing the code.

## Code Structure And Design Pattern:
<img src="READMEAssets/PlanetAppScreens/ProjectStructure.png" width="230" height="400">
### View:
1.  **CSDashboardView** – root view for the app.
2.  **CSDonutView** – view responsible for showing the credit score details view.
3.  **CSDetailsView** – view responsible for showing the credit score labels with values fetched from API.
4.  **CSDonutProgressView** – donut progress view to display the credit score percentage value.

### Model:
1.  **CSReport** – model used for the credit score json data.

### ViewModel:
1.  **CSViewModel** – viewModel responsible for managing the credit score view data.

### Networking:
1.  **NetworkManager** - responsible for managing the network call to get the data from the API.
2.  **ResponseDecoder** -  JSON decoder to parse and create the response model using JSONDecoder.
3.  **EndpointType** - protocol to get the base url and path components.
4.  **CreditScoreAPI** - enum to specify APIs available for credit score.

### Utility:
1.  **CSConstants** – responsible for maintaining the constants used in app.
2.  **Types** - contains enum types used in app to specify https methodType and APIs result(success/failure).

### Other:
1.  **CreditReportDelegate** - protocol to notify when the score data is available.(Notify Success or Failure)

## Unit Testing: 
Apples **XCTest framework** is used to write the unit tests and UI tests for the application.
Following image illustrates the **test coverage** of the project.
<img src="READMEAssets/PlanetAppScreens/TestCoverage.png" width="800" height="400">


## Future Features And Improvements:
1.  Parse and show more details of the credit score report.
2.  Write more Unit Tests.

## Application Screens:
<p float="left">
<img src="READMEAssets/PlanetAppScreens/Portrait2-iPhone.png" width="250" height="450">
<img src="READMEAssets/PlanetAppScreens/Portrait1-iPhone.png" width="250" height="450">
<img src="READMEAssets/PlanetAppScreens/Portrait2-iPhone.png" width="250" height="450">
</p>


