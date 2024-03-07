import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea_5/providers/create_page_provider.dart';
import 'package:tarea_5/shared/providers/forage_list_provider.dart';
import 'package:tarea_5/shared/widgets/app_bar.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: ForageAppBar(), body: MainCreate());
  }
}

class MainCreate extends StatelessWidget {
  const MainCreate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(20.0),
        children: const [
          NameTextField(),
          LocationTextField(),
          SeasonCheck(),
          NotesTextField(),
          ActionButtons(),
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
        ),
        onPressed: () {
          if (context.read<CreatePageProvider>().nameController.text != '' &&
              context.read<CreatePageProvider>().locationController.text !=
                  '') {
            // We create the element with all the data
            context.read<CreatePageProvider>().saveForage();
            // We save the data in the list
            context
                .read<ForageListProvider>()
                .addForage(context.read<CreatePageProvider>().forageElement);
            Navigator.pop(context);
          }
        },
        child: const Text('SAVE', style: TextStyle(color: Colors.white)),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
        ),
        onPressed: () {
          // Reset the data
          context.read<CreatePageProvider>().nameController.clear();
          context.read<CreatePageProvider>().locationController.clear();
          context.read<CreatePageProvider>().notesController.clear();
          if (context.read<CreatePageProvider>().isInSeason) {
            context.read<CreatePageProvider>().toggleIsInSeason();
          }
        },
        child: const Text('DELETE', style: TextStyle(color: Colors.white)),
      ),
    ]);
  }
}

class NotesTextField extends StatelessWidget {
  const NotesTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextField(
        controller: context.watch<CreatePageProvider>().notesController,
        decoration: const InputDecoration(
          labelText: 'Notes',
          hintText: 'Enter the notes',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class SeasonCheck extends StatelessWidget {
  const SeasonCheck({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        onChanged: (bool? value) {
          context.read<CreatePageProvider>().toggleIsInSeason();
        },
        value: context.watch<CreatePageProvider>().isInSeason,
      ),
      title: const Text('Currently in season'),
    );
  }
}

class LocationTextField extends StatelessWidget {
  const LocationTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextField(
        controller: context.watch<CreatePageProvider>().locationController,
        decoration: const InputDecoration(
          labelText: 'Location',
          hintText: 'Enter the location',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextField(
        controller: context.watch<CreatePageProvider>().nameController,
        decoration: const InputDecoration(
          labelText: 'Name',
          hintText: 'Enter the name',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
