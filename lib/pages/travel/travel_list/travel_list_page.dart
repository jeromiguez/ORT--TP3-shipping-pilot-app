import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/pages/travel/travel_list/widgets/travel_list_widget.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/widgets/index.dart';
import 'package:shipping_pilot/pages/index.dart';

import 'package:shipping_pilot/models/index.dart';

class TravelListPage extends ConsumerWidget {
  static const String name = 'TravelList';

  const TravelListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TravelProviderModel tpm = ref.watch(travelProvider);

    //? Waiting to receive the route information.
    if (tpm.isLoading) {
      return const LoadingPage();
    }

    List<Travel> travels = tpm.travels;

    print(travels);

    if (travels.isEmpty) {
      return const TravelDetailEmptyStateWidget();
    }

    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: const AppbarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SectionTitleWidget(text: 'Recorridos'),
            TravelListWidget(travels: travels),
          ],
        ),
      ),
    );
  }
}
