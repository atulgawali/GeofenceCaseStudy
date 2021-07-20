# GeofenceCaseStudy
 The clients see value in understanding space and occupancy utilisation of commercial buildings. The research shows that can leverage its mobile app to get anonymized building occupancy data. We can use access control integration with geofence triggers to better understand the entry/exist.
 
 App Video: 

https://user-images.githubusercontent.com/9925410/126366648-0a2f21ec-6950-475e-a9fb-4b25e201eb09.mp4


## Contents
* [Setup](#setup)
* [App Architecture](#app-architecture)
* [GeofenceTracker](#app-architecture)
* [LocationEventManager](#app-architecture)
* [GeofenceRegion](#app-architecture)
* [EventLogger](#app-architecture)

## Setup

### Get the Source

1. Clone the repository:
        $ git clone https://github.com/atulgawali/GeofenceCaseStudy
        
2. Use the Updated Xcode 13.0.

3. Run the GeofenceCaseStudy.xcworkspace     

4. If any pod error display at a run time then install the cocoapod dependencies:

       $ pod install.    

## App Architecture

The GeofenceCaseStudy App uses a data flow architecture based on **MVC** and **Singleton**.

<img width="1027" alt="App_Basic_Design" src="https://user-images.githubusercontent.com/9925410/126358218-a4eeaca8-94bf-414f-a550-7fedaa0c29be.png">

## GeofenceTracker

The GeofenceTracker is a module, we can integrate in multiple app. Just we need to copy the GeofenceTracker folder inside the new project.

After that use the shared instance to call the fetch region function.

## LocationEventManager 

LocationEventManager is used to track the region change event.

## GeofenceRegion

 GeofenceRegion Is the struct model used to show region data.
 
 We can extent the model in realm, core-data or sqlite to persist along the app kill scenario.

## EventLogger

 Event logger support various type of logging.
 
 We can use the event logger for warning, server error and information log, base on our requirement we need to pass log type.
 
 
