import 'package:flutter/material.dart';
import 'package:odev6/grid_liste.dart';
import 'package:odev6/sidescroll_list.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}


class _AnasayfaState extends State<Anasayfa> {
  Future<List<GridListe>> gridListeyiGetir() async{
    var gridListe = <GridListe>[];
    var g1 = GridListe(listeAdi: "Kurban", listeResmi: "kurban_cover.jpg");
    var g2 = GridListe(listeAdi: "Gülümse", listeResmi: "kurban_single.jpg");
    var g3 = GridListe(listeAdi: "The HU", listeResmi: "the hu.jpg");
    var g4 = GridListe(listeAdi: "This is Death", listeResmi: "death_playlist.jpg");
    var g5= GridListe(listeAdi: "Daily Mix 4", listeResmi: "dailymix4.jpg");
    var g6 = GridListe(listeAdi: "Daily Mix 5", listeResmi: "dailymix5.jpg");
    
    gridListe.add(g1);
    gridListe.add(g2);
    gridListe.add(g3);
    gridListe.add(g4);
    gridListe.add(g5);
    gridListe.add(g6);
    return gridListe;

  }

  Future<List<SideScrollList>> sideScrollListGetir() async{
    var horizontalList = <SideScrollList>[];
    var s1 = SideScrollList(sidelistAdi: "Daily Mix 1", sidelistResmi: "dailymix1.jpg");
    var s2 = SideScrollList(sidelistAdi: "Daily Mix 2", sidelistResmi: "dailymix2.jpg");
    var s3 = SideScrollList(sidelistAdi: "Daily Mix 3", sidelistResmi: "dailymix3.jpg");

   horizontalList.add(s1);
   horizontalList.add(s2);
   horizontalList.add(s3);
    return horizontalList;

  }
  
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF212121),
        title: Text("Spotify", style: TextStyle(fontFamily: 'Work Sans', fontWeight: FontWeight.bold)),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.history)),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextButton(onPressed: (){}, child: Text("Music", style: TextStyle(color: Colors.white, fontFamily: 'Work Sans'),), style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF535353)),

                    ),),
                  ),

                  TextButton(onPressed: (){}, child: Text("Podcasts & Shows", style: TextStyle(color: Colors.white, fontFamily: 'Work Sans'),), style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF535353)),

                  ),)
                ],
              ),
              FutureBuilder<List<GridListe>>(
                future: gridListeyiGetir(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    var gridListe = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: gridListe!.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3/1),
                          itemBuilder: (context, index){
                          var list = gridListe[index];
                          return Card(

                            semanticContainer: true,
                            color: Color(0xFF535353),
                            child: Row(
                              children: [
                                Image.asset("resimler/${list.listeResmi}", fit: BoxFit.fitHeight),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(list.listeAdi, style:TextStyle(color: Colors.white,fontFamily: 'Work Sans' ,fontWeight: FontWeight.bold) , ),
                                ),
                              ],
                            ),
                          );
                          }
                      ),
                    );
                  }else{
                    return const Center();
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 280, top: 10),
                child: const Text("Made For You", style: TextStyle(color: Colors.white, fontFamily: 'Work Sans',fontWeight: FontWeight.bold, fontSize: 15)),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Card(
                          color: Color(0xFF212121),
                          child:
                          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("resimler/dailymix1.jpg"),
                              Text("Daily Mix 1", style: TextStyle(color: Colors.white, fontFamily: "Work Sans", fontWeight: FontWeight.bold), ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        child: Card(
                          color: Color(0xFF212121),
                          child:
                          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("resimler/dailymix2.jpg"),
                              Text("Daily Mix 2", style: TextStyle(color: Colors.white, fontFamily: "Work Sans", fontWeight: FontWeight.bold), ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        child: Card(
                          color: Color(0xFF212121),
                          child:
                          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("resimler/dailymix3.jpg"),
                              Text("Daily Mix 3", style: TextStyle(color: Colors.white, fontFamily: "Work Sans", fontWeight: FontWeight.bold), ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 280, top: 10),
                child: const Text("Jump back in", style: TextStyle(color: Colors.white, fontFamily: 'Work Sans',fontWeight: FontWeight.bold, fontSize: 15)),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Card(
                          color: Color(0xFF212121),
                          child:
                          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("resimler/dailymix6.jpg"),
                              Text("Daily Mix 6", style: TextStyle(color: Colors.white, fontFamily: "Work Sans", fontWeight: FontWeight.bold), ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        child: Card(
                          color: Color(0xFF212121),
                          child:
                          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("resimler/rockanthems.jpg"),
                              Text("Metallica, Nirvan...", style: TextStyle(color: Colors.white, fontFamily: "Work Sans", fontWeight: FontWeight.bold), ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        child: Card(
                          color: Color(0xFF212121),
                          child:
                          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("resimler/amon.jpg"),
                              Text("This is Amon Amarth", style: TextStyle(color: Colors.white, fontFamily: "Work Sans", fontWeight: FontWeight.bold), ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black.withOpacity(0.1),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home_filled, color: Colors.white,),label: "Home", ),
            BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.white,), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.my_library_music, color: Colors.white,), label: "Your Library",)
          ],
      ),
    );
  }
}




/*class _AnasayfaState extends State<Anasayfa> with SingleTickerProviderStateMixin{
  late final TabController _tabController;

  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     body: NestedScrollView(
         headerSliverBuilder:(BuildContext context, bool innerBoxScrolled) {
           return <Widget>[
             SliverAppBar(
               title: Text("Spotify"),
               pinned: true,
               floating: true,
               forceElevated: innerBoxScrolled,
               bottom: ButtonsTabBar(
                 tabs: [
                 Tab(text: "music",),
                 Tab(text: "Podcasts & shows",)
                 ,],
                 controller: _tabController,
               ),
               /*TabBar(
                 indicator: BoxDecoration(
                   borderRadius: BorderRadius.circular(40),
                 ),
                 splashBorderRadius: BorderRadius.circular(40),
                 tabs: <Tab>[
                 Tab(text: "music", ),
                   Tab(text: "Podcasts & Shows",),
               ],
               controller: _tabController,
               ),*/
             ),
           ];
         },
         body:TabBarView(
           controller: _tabController,
           children: [


           ],
         ), ),
   );
  }*/

/*<Widget>[
                Card(
                  child: Row(
                    children: [
                      Image.asset("resimler/kurban_album.jpg"),
                      Text("Kurban"),
                    ],
                  ),
                ),
                Card(
                  child: Row(
                    children: [
                      Image.asset("resimler/kurban_album.jpg"),
                      Text("Kurban"),
                    ],
                  ),
                ),
                Card(
                  child: Row(
                    children: [
                      Image.asset("resimler/kurban_album.jpg"),
                      Text("Kurban"),
                    ],
                  ),
                ),
                Card(
                  child: Row(
                    children: [
                      Image.asset("resimler/kurban_album.jpg"),
                      Text("Kurban"),
                    ],
                  ),
                ),
              ],*/

/*GridView.count(
              crossAxisCount: 2,


              primary: true,
                padding: const EdgeInsets.all(15),

              children: List.generate(6, (index){

                return Container(
                  child: Card(
                    child: Row(
                      children: [
                        Image.asset("resimler/${gr}")
                      ],
                    ),
                  ),
                ),
              })

            ),*/

