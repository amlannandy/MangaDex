import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:mangadex_mobile/screens/home/state/home_bloc.dart';
import 'package:mangadex_mobile/screens/home/state/home_state.dart';
import 'package:mangadex_mobile/widgets/error_state.dart';
import 'package:mangadex_mobile/widgets/loading_spinner.dart';
import 'package:mangadex_mobile/widgets/manga_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HomeState>(
      stream: Provider.of<HomeBloc>(context).homeState,
      initialData: HomeState.loading(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.data == null) {
          return const CustomLoadingSpinner();
        }
        final state = snapshot.data!;
        if (state.isLoading) {
          return const CustomLoadingSpinner();
        }
        if (state.error != null) {
          return const ErrorState(
            title: 'Oops!',
            description: 'Something went wrong while loading Manga for you',
          );
        }
        final mangas = state.mangas!;
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7,
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (ctx, index) => MangaTile(mangas[index]),
          itemCount: mangas.length,
        );
      },
    );
  }
}
