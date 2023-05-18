# GPT Flutter test


## Getting Started

You can read this short docs by know more about project structure.
__More comments are presents in core files.__

## How to run the app

 0. Clone repository into local folder.
 1. Use pub to get packages.
 2. Open an emulator or connect your device to pc. (Can execute in web mode.)
 2. Open a shell and write *flutter run* and select your device.
## Get and OpenAi Api Key
 0. Go to https://platform.openai.com/ web site.
 1. Login, and go to *api keys*. 
 2.  Generate the Api Key and paste into the input of flutter app.  (The app must be running).
3. Once you place the API Key just send and message like "Hey!". The Ia is prepared for get a conversation context.

### Project Architecture

This app was made with SOLID principles and Cubit state managment.  

Directory Structure:
Overview:

 - core: Represents the logical methods that i use for manage the state and get data from the frontend.

 - presentation: Contains the user interface,split on views and widgets.

 Complete Structure
    
    -lib
       - core
         - bloc
         - repository
         - services 
         - types
         - core.dart 
       - presentation
         - views
         - widgets
       - gpt_test.dart
       - main.dart


