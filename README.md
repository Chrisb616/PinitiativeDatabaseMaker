# Lemon Handshake Database Maker

A companion for the Flatiron team Lemon Handshake's community organization app.

The purpose of this app is to parse through the NYC Open Data info available online via JSON and convert that into information more easily available for users, via Firebase.

This process will include API calls to NYC Open Data, which will store data on the app. That info will then be parsed through by functions to organize the info, and provide new info (i.e. coordinates based off of provided address) and converted into dictionaries. Those dictionaries will then be stored on Firebase for use by the users of the Initatives app.

## How to get GeoFire 1.1 working
GeoFire hasn't been updated in some time. Until Firebase comes out with a new version for Swift 3, there are a few steps that need to be followed to get GeoFire up and running.

First of all, in your podfile, instead of writing the pod that GeoFire asks you to on their site, write the following:

`pod 'GeoFire', :git => 'https://github.com/firebase/geofire-objc.git'`

Now run `pod install` in  your terminal. When you open up the workspace, you'll find that you get an error reading 'FirebaseDatabase/FirebaseDatabase.h file not found' when you try to build.

To solve this, go to the file that has the error. Go to your navigator, and find the file 'FirebaseDatabase.h' in your structure.

![alt text](http://i.imgur.com/E2po94Z.png "Find the FirebaseDatabase.h file")

Click and drag that file into the code file you're working with. When you release it, it should give you a file path. This is the correct file path for your 'FirebaseDatabase.h' file. Now type `#import` before the path, and wrap the path in angled brackets `< >`.

![alt text](http://i.imgur.com/duiX4O0.png "#import the file path")

As our repository has a .gitignore that ignores our pods, this has to be done each time you clone the project.