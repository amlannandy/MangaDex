import 'package:flutter/material.dart';
import 'package:mangadex_mobile/screens/home/state/home_bloc.dart';
import 'package:mangadex_mobile/screens/home/state/home_state.dart';
import 'package:provider/provider.dart';

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
          return const Center(child: Text("Loading"));
        }
        final state = snapshot.data!;
        if (state.isLoading) {
          return const Center(child: Text("Loading"));
        }
        if (state.error != null) {
          return Center(
            child: Text(state.error!),
          );
        }
        final manga = state.manga!;
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (ctx, index) => Image.network(
            manga[index].thumbnail!,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          itemCount: manga.length,
        );
      },
    );
  }
}
