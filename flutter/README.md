# Secret Hero Setup

## Description

Secret Hero is a sdk designed to add gaming functionalities into your application. This SDK empowers developers to integrate engaging gameplay experiences, including leaderboard tracking and coupon rewards, enhancing user engagement and retention within your app.

## Installation

To integrate the SecretHero library into your project, add the following dependency as follows;

With Flutter:

```flutter
$ flutter pub add secrethero_flutter
```

This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):

```flutter
dependencies:
  secrethero_flutter: "latest_version"
```

## Setup

### Initialize Secret Hero

1. The initialize function within the SecretHero SDK is responsible for initializing the SDK with specific configuration settings and an listener to handle events and callbacks.

2. The SecretHeroConfig class is responsible for the configuration initializing the SecretHero SDK.

```dart
SecretHero().initialize(secretHeroConfig, secretHeroListener)
```

```dart
SecretHeroConfig(
      token: "your_token",
      userId: "user_id",
      country: "country",
      language: "language",
      iconImage: iconImage,
      isLayoutLTR: isLayoutLTR,
      displayName: "display_name",
      theme: SecretHeroTheme(
        primaryColor: "#191D21",
        secondaryColor: "#FFFFFF",
        highlightColor: "#7B61FF",
        buttonColor: "#92FFD7",
      ));

SecretHero.initialize(config: config, delegate: self)
```

* `token`: A token required for authentication and interaction with the SecretHero SDK.
* `userId`: Represents the user ID associated with the SecretHero session.
* `displayName`: An display name for the user within the SecretHero environment.
* `language`: An optional string indicating the preferred language setting.
* `country`: An optional string indicating the preferred country setting.
* `iconImage`: An optional String representing the file path name of application image.
* `isLayoutLTR`: An optional boolean value indicating the layout direction.

* `primaryColor`: An integer value representing the primary color used in the sdk's interface or visual elements (text color).
* `secondaryColor`: An integer value representing the primary color used in the sdk's interface or visual elements (background color).
* `highlightColor` : An integer value representing the color used to highlight specific elements or actions within the sdk's interface
* `buttonColor` : An integer value specifying the color utilized for buttons or interactive elements within the sdk's interface

3. The `SecretHeroEventListener` delegate serves as a callback mechanism within the SecretHero SDK, providing methods to handle various events and responses during the SDK's lifecycle and operations.

```dart
final secretHeroListener = SecretHeroEventListener(
  onInitialized: () {
    print("onInitialized");
  },
  onInitializeFailed: (errorMessage) {
    print("onInitializeFailed $errorMessage");
  }, 
  onOpen: () {
    print("onOpen");
  }, 
  onClose: () {
    print("onClose");
  }, 
  onEvent: (event) {
    print("onEvent $event");
  });
```

* `onInitialized()`: Invoked when the SecretHero SDK is successfully initialized.
* `onInitializeFailed(errorMessage: String)` : Triggered upon initialization failure in the SecretHero SDK
* `onClose()` : Called when the SecretHero session is closed or terminated
* `onOpen()` : Executed when the SecretHero session is opened or activated
* `onEvent()` : Executed when the SecretHeroEvent is accrued


4. `The release()` function within the SecretHero serves the purpose of releasing and resetting configuration and listeners associated with the SecretHero. Need to be called onDestroy

