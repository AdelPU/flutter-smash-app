import 'package:flutter/material.dart';
import 'package:smash/widgets/info_contact/info.dart';
import 'package:smash/widgets/tabs/app_bar.dart';

class InfoContactScreen extends StatelessWidget {
  const InfoContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: TabsAppBar(
          page: 0,
          onPressedBackward: () {},
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: const Column(
          children: [
            Info(),
          ],
        ),
      ),
    );
  }
}
