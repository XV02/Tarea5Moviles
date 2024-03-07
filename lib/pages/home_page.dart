import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea_5/shared/providers/forage_list_provider.dart';
import 'package:tarea_5/shared/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ForageAppBar(),
        body: const HomePageList(),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.purple,
          onPressed: () {
            Navigator.pushNamed(context, '/create');
          },
          child: const Icon(Icons.add, color: Colors.white),
        ));
  }
}

class HomePageList extends StatelessWidget {
  const HomePageList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: context.watch<ForageListProvider>().length(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(context.watch<ForageListProvider>().get(index).name!),
            subtitle:
                Text(context.watch<ForageListProvider>().get(index).location!),
            onTap: () {
              context.read<ForageListProvider>().setSelectedForage(
                  context.read<ForageListProvider>().get(index));
              Navigator.pushNamed(context, '/details');
            },
          );
        });
  }
}
