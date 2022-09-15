# MangaDex

This is a mobile-based Manga Reader Application built off the [MangaDex API](https://api.mangadex.org/docs/) which provides the following functionalities -

- Explore and various manga available in the MangaDex database
- Search for manga based on name, author, publication date and other parameters
- Login/Register with MangaDex account to bookmark manga and track your reading status

## Local Development Setup

Create a `config.dart` file inside `lib` directory and add the following values -

```
const BASE_API_URL = "https://api.mangadex.org";
const COVERS_STORAGE_URL = "https://uploads.mangadex.org/covers";
```

Install project dependencies

```
flutter pub get
```

Run the app

```
flutter run
```

## Building the App

To build the app for Android

```
flutter build apk
```

For iOS

```
flutter build ios
```

## Screenshots

<div style="flex-direction: row;">
  <img src="https://user-images.githubusercontent.com/45410599/190308659-207afb16-18b5-41f3-9392-667665903833.png" width="200px" style="margin-right: 10px;" alt="">
  <img src="https://user-images.githubusercontent.com/45410599/190308674-01c842b7-ae23-458b-9dfc-47452130dd5a.png" width="200px" alt="">
</div>
