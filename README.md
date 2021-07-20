# GeofenceCaseStudy
## The clients see value in understanding space and occupancy utilisation of commercial buildings. The research shows that cohesion can leverage its mobile app to get anonymized building occupancy data. We can use access control integration with geofence triggers to better understand the entry/exist
## The GeofenceCaseStudy app used the MVC design patter to display ui and manage flow.

## GeofenceTracker
### The GeofenceTracker is a module, we can integrate in multiple app as well, Just we need to copy the folder and using shared instance we can get the region date.
### All The required logic written inside the module, any developer can reused.
### The GeofenceTracker Is used to track the region, Using in memory store to store the list of region.
### The GeofenceTracker is singleton class, develop don't need to create new instance. Can use the shared instance to fetch the data.

## LocationEventManager 
### LocationEventManager is used to track the location, contains region update delegate. base on that updating the model and displaying updated data on the screen.

## GeofenceRegion
### Is the struct model used to handle data in the in memory using singleton.
### Contains various filed id, name, lat and long etc.

<img width="838" alt="App_Basic_Design" src="https://user-images.githubusercontent.com/9925410/126334771-97ebeeeb-1111-4ca4-977b-7a3f4db516f1.png">
