import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';

class DonasiCard extends StatelessWidget {
  final Object tag;
  final VoidCallback onTap;
  const DonasiCard({Key? key, required this.tag, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.black54,
        child: Container(
          width: 200,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Hero(
                  tag: tag,
                  child: Image.asset(
                    'assets/1.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Koin untuk adri',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Jabar Sejahtera',
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        backgroundColor: greyColor,
                        color: progressBarColor,
                        minHeight: 5,
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation(progressBarColor),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Terkumpul',
                              style: blackTextStyle.copyWith(fontSize: 12),
                            ),
                            Text(
                              'Rp 200.000',
                              style: blackTextStyle.copyWith(fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'dibutuhkan',
                              style: blackTextStyle.copyWith(fontSize: 12),
                            ),
                            Text(
                              'Rp 1.600.000',
                              style: blackTextStyle.copyWith(fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DonasiCardList extends StatelessWidget {
  final Object tag;
  final VoidCallback onTap;
  const DonasiCardList({super.key, required this.tag, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(10)),
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: tag,
                  child: Image.asset(
                    'assets/1.png',
                    height: 130,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Koin Untuk Adri',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: black),
                      ),
                      Text(
                        'Jabar Sejahtera',
                        style: blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: regular),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: LinearProgressIndicator(
                          backgroundColor: greyColor,
                          color: progressBarColor,
                          minHeight: 5,
                          value: 0.5,
                          valueColor: AlwaysStoppedAnimation(progressBarColor),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Terkumpul',
                                style: blackTextStyle.copyWith(fontSize: 12),
                              ),
                              Text(
                                'Rp 200.000',
                                style: blackTextStyle.copyWith(fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'dibutuhkan',
                                style: blackTextStyle.copyWith(fontSize: 12),
                              ),
                              Text(
                                'Rp 1.600.000',
                                style: blackTextStyle.copyWith(fontSize: 12),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final VoidCallback? onTap;
  final Object tag;
  const EventCard({super.key, this.onTap, required this.tag});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(right: 8),
        width: 180,
        height: 220,
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Hero(tag: tag, child: Image.asset('assets/2.png'))),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Seminar Wibu',
                    style:
                        blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text('30 Februari 2022')
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text('Kirigakure')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
