import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/pages/event/event_detail_page.dart';
import 'package:jabar_sejahtera/ui/widgets/custom_card.dart';

class EventPage extends StatelessWidget {
  const EventPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Event',
          style: blackTextStyle,
        ),
        centerTitle: true,
        leading: const SizedBox.shrink(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  suffixIcon: Icon(
                    Icons.search,
                    color: blackColor,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  crossAxisCount: 2,
                  mainAxisExtent: 210),
              itemBuilder: (BuildContext context, int index) {
                return EventCard(
                  tag: 'img$index',
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EventDetailPage(tag: 'img$index'))),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
