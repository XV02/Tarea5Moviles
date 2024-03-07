import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea_5/shared/providers/forage_list_provider.dart';
import 'package:tarea_5/shared/widgets/app_bar.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: ForageAppBar(), body: DetailsMain());
  }
}

class DetailsMain extends StatelessWidget {
  const DetailsMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          context.watch<ForageListProvider>().selectedForage.name!,
          style: const TextStyle(fontSize: 24),
        ),
      ),
      Expanded(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.add_location),
              title: Text(
                  context.watch<ForageListProvider>().selectedForage.location!),
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: Text(
                  context.watch<ForageListProvider>().selectedForage.isInSeason!
                      ? 'Curently in season'
                      : 'Not in season'),
            ),
            ListTile(
              leading: const Icon(Icons.notes),
              title: Text(
                  context.watch<ForageListProvider>().selectedForage.notes!),
            ),
          ],
        ),
      ),
    ]);
  }
}
