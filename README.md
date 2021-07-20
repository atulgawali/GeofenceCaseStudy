# GeofenceCaseStudy
 The clients see value in understanding space and occupancy utilisation of commercial buildings. The research shows that can leverage its mobile app to get anonymized building occupancy data. We can use access control integration with geofence triggers to better understand the entry/exist.

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

3. Run the GeofenceCaseStudy.xcodeproj     .    

## App Architecture

The GeofenceCaseStudy App uses a data flow architecture based on **MVC** and **Singleton**.

<img width="1027" alt="App_Basic_Design" src="https://user-images.githubusercontent.com/9925410/126358218-a4eeaca8-94bf-414f-a550-7fedaa0c29be.png">

## GeofenceTracker

The GeofenceTracker is a module, we can integrate in multiple app. Just we need to copy the folder and using shared instance we can get the region data.

All The required logic written inside the module.

## LocationEventManager 

LocationEventManager is used to track the region change event.

## GeofenceRegion
 GeofenceRegion Is the struct model used to handle data in the memory using singleton class.
 
 We can use to extent to persist using realm, core-data or sqlite.

## EventLogger

 Event logger support various type of logging.
 
 We can use for warning log, server log, and information log base on our requirement we just need to pass log type.
