import 'package:mangadex_mobile/models/manga.dart';

class HomeState {
  late bool isLoading;
  String? error;
  List<Manga>? mangas;

  HomeState.loading() {
    isLoading = true;
  }

  HomeState.success(this.mangas) {
    isLoading = false;
  }

  HomeState.error(this.error) {
    isLoading = false;
  }
}
