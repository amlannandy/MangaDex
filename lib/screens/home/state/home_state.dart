import 'package:mangadex_mobile/models/manga.dart';

class HomeState {
  late bool isLoading;
  String? error;
  List<Manga>? manga;

  HomeState.loading() {
    isLoading = true;
  }

  HomeState.success(this.manga) {
    isLoading = false;
  }

  HomeState.error(this.error) {
    isLoading = false;
  }
}
