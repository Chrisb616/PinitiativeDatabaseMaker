# Lemon Handshake Database Maker

A companion for the Flatiron team Lemon Handshake's community organization app.

The purpose of this app is to parse through the NYC Open Data info available online via JSON and convert that into information more easily available for users, via Firebase.

This process will include API calls to NYC Open Data, which will store data on the app. That info will then be parsed through by functions to organize the info, and provide new info (i.e. coordinates based off of provided address) and converted into dictionaries. Those dictionaries will then be stored on Firebase for use by the users of the Initatives app.

## How to get GeoFire 1.1 working
GeoFire hasn't been updated in some time. Until Firebase comes out with a new version for Swift 3, there are a few steps that need to be followed to get GeoFire up and running.

First of all, in your podfile, instead of writing the pod that GeoFire asks you to on their site, write the following:

`pod 'GeoFire', :git => 'https://github.com/firebase/geofire-objc.git'`

Now run `pod install` in  your terminal. When you open up the workspace, you'll find that you get an error reading 'FirebaseDatabase/FirebaseDatabase.h file not found' when you try to build.

To solve this, go to your Navigator. Go to Pods > FirebaseDatabase > Frameworks > FirebaseDatabase.framework. 

![alt text](http://i.imgur.com/ZrVnvc0.png "Find the FirebaseDatabase.framework")

Select that file. In the Utilities, inside of the File Inspector, check the box inside Target Membership that reads "GeoFire". 

![alt text](http://i.imgur.com/KkoB6WW.png "Set the GeoFire Framwork to require.")

As our repository has a .gitignore that ignores our pods, this has to be done each time you clone the project.
As our repository has a .gitignore that ignores our pods, this has to be done each time you clone the project.
