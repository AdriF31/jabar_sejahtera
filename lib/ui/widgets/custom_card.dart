import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/shared/theme.dart';

class DonasiCard extends StatelessWidget {
  final Object tag;
  final String image;
  final int terkumpul;
  final int target;
  final String title;
  final String publisher;
  final CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: 'Rp ');
  final VoidCallback onTap;
  DonasiCard(
      {super.key,
      required this.tag,
      required this.onTap,
      required this.title,
      required this.publisher,
      required this.image,
      required this.terkumpul,
      required this.target});

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
                    image,
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
                      title,
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      publisher,
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
                        value: terkumpul / target,
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
                              formatter.format(terkumpul.toString()),
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
                              formatter.format(target.toString()),
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
  final String image;
  final int terkumpul;
  final int target;
  final String title;
  final String publisher;
  final CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: 'Rp ');
  final VoidCallback onTap;
  DonasiCardList(
      {super.key,
      required this.tag,
      required this.onTap,
      required this.title,
      required this.publisher,
      required this.image,
      required this.terkumpul,
      required this.target});

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
                    image,
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
                        title,
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: black),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        publisher,
                        style: blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: regular),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: LinearProgressIndicator(
                          backgroundColor: greyColor,
                          color: progressBarColor,
                          minHeight: 5,
                          value: terkumpul / target,
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
                                formatter.format(terkumpul.toString()),
                                style: blackTextStyle.copyWith(fontSize: 14),
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
                                formatter.format(target.toString()),
                                style: blackTextStyle.copyWith(fontSize: 14),
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
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
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
                    children: const [
                      Icon(
                        Icons.calendar_month,
                        size: 24,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text('30 Februari 2022')
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        size: 24,
                      ),
                      SizedBox(
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
