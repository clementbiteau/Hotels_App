import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const dgreen = Color(0xFF54D3C2);

void  main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotels Booking',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
        children: [
          SearchSection(),
          HotelSection(),
        ],)
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context){
    return AppBar(
      leading: IconButton(
        onPressed: null,
        icon: Icon(Icons.arrow_back, color: Colors.grey[800], size: 20),),
      title: Text('Explore',
      style: GoogleFonts.nunito(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w800,
        ),),
      actions: [
        IconButton(
          onPressed: null,
          icon: Icon(Icons.favorite_border_rounded, color: Colors.grey[800], size: 20),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(Icons.place, color: Colors.grey[800], size: 20),
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset((0), 3)),
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Meow',
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,),
                      )
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset((0), 4)),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10),
                        backgroundColor: dgreen,
                      ),
                      onPressed: () {},
                      child: const Icon(
                        Icons.search,size: 26,
                        color: Colors.black,),
                      ),
                    ),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Choose Dates',
                          style: GoogleFonts.nunito(
                            color: Colors.grey,
                            fontSize: 15),),
                          Text('12 Dec - 22 Dec',
                            style: GoogleFonts.nunito(
                              color: Colors.black,
                              fontSize: 17),)
                          ],
                        ),
                      ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Number of Rooms',
                          style: GoogleFonts.nunito(
                            color: Colors.grey,
                            fontSize: 15),),
                          Text('1 Room - 2 Adults',
                            style: GoogleFonts.nunito(
                              color: Colors.black,
                              fontSize: 17),),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
  }
}

class HotelSection extends StatelessWidget {
  // ignore: unnecessary_const
  static const List hotelList = const [
    {
      'title': 'Burj Al Arab',
      'place': 'Dubai, UAE',
      'distance': 2,
      'price': '1800',
      'review': 976,
      'picture': 'images/burjalarab.png',
    },
    {
      'title': 'Eden Rock',
      'place': 'Saint Barths, France',
      'distance': 9,
      'price': '2400',
      'review': 543,
      'picture': 'images/edenrock.png',
    },
    {
      'title': 'The Labesborough',
      'place': 'London, United Kingdom',
      'distance': 78,
      'price': '890',
      'review': 129,
      'picture': 'images/lanesborough.png',
    },
    {
      'title': 'Four Seasons Megeve',
      'place': 'Megève, France',
      'distance': 30,
      'price': '760',
      'review': 34,
      'picture': 'images/mve.png',
    },
  ];

  const HotelSection({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '550 hotels found',
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 15),),
                Row(
                  children: [
                  Text(
                    'Filter',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 15),),
                const IconButton(
                  icon: Icon(
                    Icons.filter_list_outlined,
                    color: dgreen,
                    size: 15),
                    onPressed: null,
                  ),
                ],
                ),
              ],
            ),
          ),
        ...hotelList.map((hotel) => HotelCard(hotel: hotel)),
        ],
      )
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map hotel;

  const HotelCard({required this.hotel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          Image.asset(
            hotel['picture'],
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotel['title'],
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  hotel['place'],
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '${hotel['distance']} km to city',
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '\$${hotel['price']} / night',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: dgreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}