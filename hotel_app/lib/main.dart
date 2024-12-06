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
                          hintText: 'London',
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
                      color: Colors.green,
                      boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset((0), 4)),
                        ],),
                    ),
                ],),
                const SizedBox(height: 50),
                Container(height: 50, color: Colors.red,),
              ],
            ),
          );
  }
}

class HotelSection extends StatelessWidget {
  const HotelSection({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
            height: 2000,
            color: Colors.white,
          );
  }
}