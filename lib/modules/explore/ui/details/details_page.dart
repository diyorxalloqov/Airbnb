import 'package:airbnb/core/constants/app_icons.dart';
import 'package:airbnb/modules/explore/ui/widgets/page_view_widget.dart';
import 'package:airbnb/modules/explore/ui/widgets/small_google_map.dart';
import 'package:airbnb/utils/extension/size.dart';
import 'package:airbnb/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ImagePageView(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Bander Hafa- Nature's Retreat",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  const SpaceHeight(),
                  const Text(
                    'Entire villa in Haffah,Oman',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SpaceHeight(),
                  const Text(
                    '12 guest sdkjsdfjnsjkdf',
                  ),
                  const SpaceHeight(),
                  const Row(
                    children: [Icon(Icons.star), SpaceWidth(), Text('New')],
                  ),
                  const SpaceHeight(),
                  const Divider(),
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://a0.muscache.com/im/pictures/user/90f336d9-a856-4622-afa1-3bb0fb036d9a.jpg?im_w=240'),
                    ),
                    title: Text('Stay with Roberta'),
                    subtitle: Text(
                      'Superhost • 10 years hosting',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: SvgPicture.asset(AppIcons.casas, width: 30),
                    title: const Text('Stay with Roberta'),
                    subtitle: const Text(
                      'Superhost • 10 years hosting',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(AppIcons.shepherd, width: 30),
                    title: const Text('Stay with Roberta'),
                    subtitle: const Text(
                      'Superhost • 10 years hosting',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(AppIcons.tropical, width: 30),
                    title: const Text('Stay with Roberta'),
                    subtitle: const Text(
                      '10 years hosting',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(AppIcons.amaingPools, width: 30),
                    title: const Text('Stay with Roberta'),
                    subtitle: const Text(
                      'Superhost',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Divider(),
                  const SpaceHeight(),
                  const Text('Some info has been automatically translated.'),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Show original',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                        '''Nestled amidst the majestic Aravalli Hills, lies a luxurious and comfortable haven that embodies the epitome of opulence - Noah's Ark. Inspired by the biblical tale of Noah's Ark, this remarkable property boasts a breathtaking location that offers awe-inspiring views, making it the ideal getaway for those yearning to escape the hustle and bustle of city life!'''),
                  ),
                  const SpaceHeight(),
                  const Divider(),
                  const SpaceHeight(),
                  const Text(
                    "Where you'll sleep",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SpaceHeight(),
                  const SpaceHeight(),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.bedroom_parent_outlined, size: 45),
                        SpaceHeight(),
                        Text('Bedroom'),
                        Text(
                          '1 queen bed',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SpaceHeight(),
                  const SpaceHeight(),
                  const Divider(),
                  const SpaceHeight(),
                  const Text(
                    "What this place offers",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SpaceHeight(),
                  const Row(
                    children: [
                      Icon(Icons.photo_size_select_actual_rounded),
                      SpaceWidth(),
                      SpaceWidth(),
                      Text('Sea view'),
                    ],
                  ),
                  const SpaceHeight(),
                  const Row(
                    children: [
                      Icon(Icons.card_giftcard_rounded),
                      SpaceWidth(),
                      SpaceWidth(),
                      Text('Garder view'),
                    ],
                  ),
                  const SpaceHeight(),
                  const Row(
                    children: [
                      Icon(Icons.soup_kitchen_outlined),
                      SpaceWidth(),
                      SpaceWidth(),
                      Text('Kitchen'),
                    ],
                  ),
                  const SpaceHeight(),
                  const Row(
                    children: [
                      Icon(Icons.wifi),
                      SpaceWidth(),
                      SpaceWidth(),
                      Text('Wifi'),
                    ],
                  ),
                  const SpaceHeight(),
                  const Row(
                    children: [
                      Icon(Icons.car_crash_outlined),
                      SpaceWidth(),
                      SpaceWidth(),
                      Text('Free parking on permises'),
                    ],
                  ),
                  const SpaceHeight(),
                  const Row(
                    children: [
                      Icon(Icons.closed_caption_disabled_rounded),
                      SpaceWidth(),
                      SpaceWidth(),
                      Text(
                        'Carbon monoxide alarm',
                        style:
                            TextStyle(decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  const SpaceHeight(),
                  const Row(
                    children: [
                      Icon(Icons.smoke_free),
                      SpaceWidth(),
                      SpaceWidth(),
                      Text(
                        'Smoke alarm',
                        style:
                            TextStyle(decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  const SpaceHeight(),
                  const SpaceHeight(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(18.0),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: Colors.black, width: 1))),
                      child: const Center(
                        child: Text(
                          'Show all 61 amenities',
                          style: TextStyle(color: Colors.black),
                        ),
                      )),
                  const SpaceHeight(),
                  const SpaceHeight(),
                  const Divider(),
                  const SpaceHeight(),
                  const SpaceHeight(),
                  const Text(
                    "Where you'll be",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SpaceHeight(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SmallGoogleMaps()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      height: 300,
                      child: const SmallGoogleMaps(),
                    ),
                  ),
                  const SpaceHeight(),
                  const Text('Rethimmon, Greece',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                        ''' It’s a great location. Peaceful & serene.The staff present at the property (depak) is great and would arrange for all your needs and is a superb cook'''),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Text(
                          'Show more',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SpaceWidth(),
                        Icon(Icons.keyboard_arrow_right_outlined)
                      ],
                    ),
                  ),
                  const SpaceHeight(),
                  const SpaceHeight(),
                  const Divider(),
                  const SpaceHeight(),
                  Row(
                    children: [
                      const Icon(Icons.star),
                      const SpaceWidth(),
                      Text('4.91 • 295 reviews',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: GoogleFonts.comfortaa().fontFamily)),
                      const SpaceHeight(),
                    ],
                  ),
                  SizedBox(
                      height: context.height * 0.35,
                      child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                margin: const EdgeInsets.all(10.0),
                                padding: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('★★★★★★ 2 weeks ago',
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.comfortaa()
                                                .fontFamily)),
                                    const SpaceHeight(),
                                    SizedBox(
                                      width: context.width * 0.4,
                                      child: const Text(
                                        'An aipur also referred to as the Pink City, is surrounded by Aravalli Hills and is famous for its heritage and fascinating monuments. Traditional hand-loom garments, flamboyant markets, and wonderfully laid-out gardens are just a few things to look forward to in this beautiful city',
                                        maxLines: 4,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                    const SpaceHeight(),
                                    GestureDetector(
                                      onTap: () {},
                                      child: const Text(
                                        'Show more',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    const Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://a0.muscache.com/im/pictures/user/e6c8be48-cc5e-41dd-b65a-0c69169adf69.jpg?im_w=240'),
                                        ),
                                        SpaceWidth(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Rachel Anne',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              'Makati,Philippines',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SpaceHeight(),
                                    const SpaceHeight(),
                                  ],
                                ),
                              ),
                            );
                          })),
                  const SpaceHeight(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(18.0),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: Colors.black, width: 1))),
                      child: const Center(
                        child: Text(
                          'Show all 61 amenities',
                          style: TextStyle(color: Colors.black),
                        ),
                      )),
                  const SpaceHeight(),
                  const SpaceHeight(),
                  const Divider(),
                  const SpaceHeight(),
                  const SpaceHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: context.width * 0.6,
                        child: const Text(
                          "Hosted by Camper and Cabin",
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://a0.muscache.com/im/Portrait/Avatars/messaging/b3e03835-ade9-4eb7-a0bb-2466ab9a534d.jpg?im_policy=medq_w_text&im_t=R&im_w=240&im_f=airbnb-cereal-medium.ttf&im_c=ffffff'),
                          ),
                          Positioned(
                              left: 25,
                              child: Icon(
                                Icons.check,
                                color: Colors.red,
                              ))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 1,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: ListTile(
          title: const Row(
            children: [
              Text(
                '\$558 ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('night'),
            ],
          ),
          subtitle: const Text(
            'Feb 19-24',
            style: TextStyle(
                decoration: TextDecoration.underline, color: Colors.black),
          ),
          trailing: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent.shade400,
                  padding: const EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text(
                "Reserve",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
        ),
      ),
    );
  }
}
