import 'dart:async';

import 'package:mangadex_mobile/api/repository.dart';
import 'package:mangadex_mobile/screens/home/state/home_state.dart';

class HomeBloc {
  final Repository _repository = Repository();

  final StreamController<HomeState> _homeController =
      StreamController<HomeState>();

  Stream<HomeState> get homeState => _homeController.stream;

  void refresh() {
    _getMangaList();
  }

  void _getMangaList() async {
    try {
      _homeController.add(HomeState.loading());
      final manga = await _repository.getMangaList();
      _homeController.add(HomeState.success(manga));
    } catch (e) {
      _homeController.add(HomeState.error(e.toString()));
    }
  }
}
