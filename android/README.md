# Secret Hero Setup

## Description

Secret Hero is a sdk designed to add gaming functionalities into your application. This SDK empowers developers to integrate engaging gameplay experiences, including leaderboard tracking and coupon rewards, enhancing user engagement and retention within your app.

## Installation

To integrate the SecretHero library into your project, add the following dependency in your app's build.gradle file:

```gradle
implementation 'io.secrethero.secrethero:secrethero:<latest-version>'
```

## Setup


### SecretHeroView

The SecretHeroView button is designed to enable navigation to the SecretHero SDK's screen and allowing users to access features.

`start` function can be used to trigger to start sdk screens.

```xml
<com.gamesdk.ui.feature.secrethero.SecretHeroView
        android:id="@+id/secretHeroView"
        android:layout_width="75dp"
        android:layout_height="75dp" />
```

### Initialize Secret Hero

1. The initialize function within the SecretHero is responsible for initializing the SDK with specific configuration settings and an listener to handle events and callbacks.

```kotlin
SecretHero.initialize(config: config, listener: listener)
```

2. The SecretHeroConfig class is responsible for the configuration initializing the SecretHero SDK. Utilizing its internal builder pattern, developers can construct a SecretHeroConfig instance with specific settings

```kotlin
SecretHeroConfig.Builder()
                .setUserId(userId)
                .setTheme(theme)
                .setLanguage(language)
                .setCountry(country)
                .setDisplayName(displayName)
                .setIconImage(image)
                .isLayoutLTR(boolean)
                .build(token)
```

* `token`: A token required for authentication and interaction with the SecretHero SDK.
* `userId`: Represents the user ID associated with the SecretHero session.
* `displayName`: An display name for the user within the SecretHero environment.
* `language`: An optional string indicating the preferred language setting.
* `country`: An optional string indicating the preferred country setting.
* `iconImage`: An optional Drawable object representing the application.
* `isLayoutLTR`: An optional boolean value indicating the layout direction.

```kotlin
SecretHeroTheme.Builder()
                .setPrimaryColor(primaryColor)
                .setSecondaryColor(secondaryColor)
                .setHighlightColor(highlightColor)
                .setButtonColor(buttonColor)
                .build()
```

* `primaryColor`: An integer value representing the primary color used in the sdk's interface or visual elements (text color).
* `secondaryColor`: An integer value representing the primary color used in the sdk's interface or visual elements (background color).
* `highlightColor` : An integer value representing the color used to highlight specific elements or actions within the sdk's interface
* `buttonColor` : An integer value specifying the color utilized for buttons or interactive elements within the sdk's interface


3. The SecretHeroListener interface serves as a callback mechanism within the SecretHero SDK, providing methods to handle various events and responses during the SDK's lifecycle and operations.

* `onInitialized()`: Invoked when the SecretHero SDK is successfully initialized.
* `onInitializeFailed(errorMessage: String)` : Triggered upon initialization failure in the SecretHero SDK
* `onClose()` : Called when the SecretHero session is closed or terminated
* `onOpen()` : Executed when the SecretHero session is opened or activated
* `onEvent(event: SecretHeroEvent, extras: Map<String,String?>)` : Called when an event is triggered. Extra information for event are gameName, gameDuration and gameCoupon.

4. The `release()` function within the SecretHero serves the purpose of releasing and resetting configuration and listeners associated with the SecretHero. Need to be called `onDestroy`
