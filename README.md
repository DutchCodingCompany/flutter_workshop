# Flutter Workshop 🐦

Welcome to the Flutter Workshop hosted by Dutch Coding Company! 🚀

## What are we going to do in this workshop? 🤔

In this git repository is the starting point of our workshop. We will be building a simple app that shows a list of beers! We will be using the [Punk API](https://punkapi.com/documentation/v2) to get our data from.

If you need any guidance, you can checkout the `completed-workshop` branch to view my solution. You'll learn most if you try it yourself, but if you get stuck, you can always take a look at my solution.

## Step 1: Run the application

I suggest opening the application in a editor that has Flutter support. I personally use VSCode, but Android Studio also has great support for Flutter. But you can use anything you want. Open the application in the editor you like. To get all the nessecary packages to run the application, run the following command in the terminal:

```bash
flutter pub get
```
Your IDE (VSCode with Flutter Extension or Android Studio) will run this automatically, so if you use them this is probably not nessecary. Everytime you change something in the pubspec.yaml file, you need to run this command again. Later more on that!

You can run the applciation by pressing the play button in the top right corner of VSCode or Android Studio. You can also run the application by running the following command in the terminal:

```bash
flutter run
```

Make sure you have selected the correct device. You can build it for Windows/Mac/Linux/Chrome, or for a device you have connnected to your computer. A third option is to run a simulator such as an iOS simulator with xCode, or an Android Simulator with Android Studio.

If all goes well, you should see a screen with a app bar and a big purple button!

## Step 2: Style the app to your own taste.
The entry point of every Flutter app can be found in the `main.dart` file. Here you see the MaterialApp built as a widget. On line 27 you see the WorkshopTheme provided. The theme is filled with fonts from Google Fonts and provided with Colors in the `workshop_colors.dart` file. Want to change the colors? Go ahead and style it to your own taste :)

on line 79 of the `main.dart` file, you see a logo added to the AppBar of the app. This is a custom image that is added to the assets folder. You can find the image in the `assets/images` folder. You can add your own image here and change the image in the AppBar to your own image. Maybe a picture of your dog? 🐶 A beer emoji? Your own logo?

Changed the styling to your likings? Lets move on to the next step!

## Step 3: Create a beer widget!

To have a nice list of beers in our app, we need to create a widget that shows a beer. We will be using the `Beer` model for this. This model can be found in the `beer.dart` file. This model has all the data we need to show a beer. Currently, the beers are already loaded and for each beer that you tapped with the purple button, a widget will be rendered. The `YourOwnWidget` widget resides in the 'widgets' folder. This is where we will be creating our own widget. Currently it is an empty container, and that is why we don't see anything yet.

Can you create a nice widget that displays the beer name, tagline and description? Maybe you can add a picture of the beer? I suggest using some of these widgets:

[- Column (to stack widgets on top of each other)](https://api.flutter.dev/flutter/widgets/Column-class.html)

[- Row (to place widgets next to each other)](https://api.flutter.dev/flutter/widgets/Row-class.html)

[- Text (to display text)](https://api.flutter.dev/flutter/widgets/Text-class.html)

[- Image.network (to display an image)](https://api.flutter.dev/flutter/widgets/Image-class.html)

[- SizedBox (to add some spacing between widgets)](https://api.flutter.dev/flutter/widgets/SizedBox-class.html)

[- Card (to add a nice background to your widget)](https://api.flutter.dev/flutter/material/Card-class.html)


And there are many more widgets to try and use. The sky is the limit!

## Step 4: Testing your application

Testing is a very important part of developing an application. It helps you to make sure your application is working as expected. In Flutter, you can write tests for your application. These tests can be unit tests, widget tests or integration tests. In this workshop we have 2 kinds of tests implemented;
- Widget tests, which render your widgets and check if they are rendered correctly. You can also interact with them here to check if changes are made to your view in a correct way.
- Golden tests, which are a different kind of widget test. They also render widgets, but make a screenshot of the expected outcome and compare it in the future. This will make sure you widgets look the same every time.

To run the tests, you can run the following command in the terminal:

```bash
flutter test
```

It is possible that the tests fail, becuase of your previous changes! However, it can be that these are intended. Check out the `full_app_golden_test.png`. Does your app look like that? If not, you should probably update your test image. You can do that by running the following command:

```bash
flutter test --update-goldens
```

This will run the tests again, but update the golden images. If you run the tests again, they should pass!

Currently, our test is testing the full app, but don't you think it also would be nice to test only the new widget you just made? Can you make a Golden Test for that widget only? I already made a start for you in the `golden_test.dart` file. 

If you want to go deeper on some testing, can you improve the teset in `widget_test.dart` as well?

## Step 5: Add a package to your application!

Luckily we don't have to reinvent the wheel when building apps. On the website pub.dev are a lot of package you can easily add to your application. Today we are going to add a bit of confetti to our app to make our app an actual party! 🎉

To add a package to your application, you can run the command `flutter pub add confetti` to add the confetti package to your application. This will add the package to your pubspec.yaml file and run the `flutter pub get` command for you. You can also add the package manually to the pubspec.yaml file and run the `flutter pub get` command yourself.

Now that we have added the package, we can use it in our application. We will be using the `ConfettiWidget` widget from the package. You can find the documentation of the package here: https://pub.dev/packages/confetti

To help you along, I've already set a hint where to add the confetti widget. This is how I configured my confetti widget, so you can paste it in there if you want (or configure it to your own likings):

```dart
  Align(
                  alignment: Alignment.center,
                  child: ConfettiWidget(
                    confettiController: controller,
                    blastDirectionality: BlastDirectionality.explosive, // don't specify a direction, blast randomly
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple
                    ], // manually specify the colors to be used
                  ),
                ),
```

After that, we need to add a controller to the state. Remove the comments I have placed before them to add them.

Whenever you tap the + button to tap another beer, you'll see confetti all over your screen! 🎉

Can you change the code so that it only shows you confetti if you load in the last beer of the list? A bit like an easter egg? 🥚


## Learn more? 📕

Have some questions you want to ask me after the workshop? Find me on [X (@Bassiuz)](https://x.com/bassiuz) or send me an email at [b@sdevaan.nl]. I'll gladly help you along with your Flutter journey!

Want to have a nice evening learning more about the tech space, while enjoying pizza and beers with other likeminded people? Come to our *free* meetup, [Checkout.events, de gezelligste dev Meetup!](https://checkout.events/)

If you want to learn more about Flutter, here are a few resources to get you started:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
