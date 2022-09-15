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
