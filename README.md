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
1.  **ContentView** – view responsible for displaying the credit score with progress bar donut view.
2.  **CreditScoreViewModel** – viewModel responsible for managing the credit score view data.
3.  **CreditReport** – model used for the credit score json data.
4.  **NetworkManager** - responsible for managing the network call to get the data from the API.
5.  **Response** - struct responsible for encoding-decoding of the json resonse of generic type.
6.  **Constants** – responsible for maintaining the constants used in app.
7.  **CreditReportDelegate** - protocol to notify when the score data is available.(Notify Success or Failure)
8.  **EndpointType** - protocol to get the base url and path components.
9.  **CreditScoreAPI** - enum to specify APIs available for credit score.
10.  **Types** - contains enum types used in app to specify https methodType and APIs result(success/failure).


## Unit Testing: 
Apples **XCTest framework** is used to write the unit tests and UI tests for the application.
Following image illustrates the **test coverage** of the project.


## Future Features And Improvements:
1.  Parse and show more details of the credit score report.
2.  Write more Unit Tests.

## Application Screens:
*  This is the landing page (Dashboard) of the app, where the Credit Score is shown inside donut view with a donut progress bar.
* Tap to Retry button is shown to allow users to fetch the credit score in case of any failure.


