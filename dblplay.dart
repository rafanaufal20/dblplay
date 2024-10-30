import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 18, 94, 181),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'logo_honda_dbl_dbl.id_1-removebg-preview.png',
              height: 40,
            ),
            Spacer(),
            Text(
              'Rafa Naufal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16.0),
                width: constraints.maxWidth > 600 ? 600 : double.infinity,
                child: Column(
                  children: [
                    _buildProfileHeader(), 
                    SizedBox(height: 20),
                    _buildSearchBar(), 
                    SizedBox(height: 20),
                    _buildHeaderSection(), 
                    SizedBox(height: 20),
                    _buildGridMenu(constraints),
                    SizedBox(height: 20),
                    _buildFeaturedNews(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildProfileHeader() {
    return CircleAvatar(
      backgroundImage: AssetImage('person.png'),
      radius: 40,
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildTopCard('My Coins', Icons.monetization_on, Colors.blue),
        _buildTopCard('Top Up', Icons.add, Colors.green),
        _buildTopCard('History', Icons.history, Colors.purple),
        _buildTopCard('Explore', Icons.explore, Colors.orange),
      ],
    );
  }

  Widget _buildTopCard(String title, IconData icon, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildGridMenu(BoxConstraints constraints) {
    int crossAxisCount = constraints.maxWidth > 400 ? 5 : 2;

    return GridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 1,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: [
        _buildMenuIcon('News', Icons.article),
        _buildMenuIcon('Video', Icons.video_library),
        _buildMenuIcon('Livestream', Icons.live_tv),
        _buildMenuIcon('Match', Icons.sports_basketball),
        _buildMenuIcon('Event Reg.', Icons.event),
        _buildMenuIcon('Votes', Icons.how_to_vote, badge: 'Open'),
        _buildMenuIcon('Gallery', Icons.photo_album, badge: 'Hot'),
        _buildMenuIcon('Ticket', Icons.confirmation_number),
        _buildMenuIcon('Games', Icons.gamepad),
        _buildMenuIcon('More', Icons.more_horiz),
      ],
    );
  }

  Widget _buildMenuIcon(String title, IconData icon, {String? badge}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              child: Icon(icon, size: 28),
            ),
            SizedBox(height: 5),
            Text(title, style: TextStyle(fontSize: 12)),
          ],
        ),
        if (badge != null)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: BoxConstraints(minWidth: 16, minHeight: 16),
              child: Text(
                badge,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFeaturedNews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Featured News',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                  'assets/C7081646-E466-41B6-A222-ED57C13FCD6A.jpg'), 
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20),

        _buildNewsList(),
      ],
    );
  }

  Widget _buildNewsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Livestream',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        _buildNewsItem(
            'assets/DBLSurabaya-Day27(4).jpg',
            'SMA PERMAI JAKARTA vs SMA 1 PSKD JAKARTA',
            '04 Sep 2024, 11:30 WIB',
            'INCOMING'),
        SizedBox(height: 10),
        _buildNewsItem(
            'assets/kansiusduand.jpg',
            'SMP NEGERI 6 SURABAYA vs SMP ANGELUS CUSTOS SURABAYA',
            '04 Sep 2024, 12:30 WIB',
            'INCOMING'),
        SizedBox(height: 10),
        _buildNewsItem(
            'assets/F6F38A71-C17A-4C31-B8A3-2A403892C091.jpg',
            'SMA JUBILEE JAKARTA vs SMA BINA BANGSA SCHOOL PANTAI INDAH KAPUK',
            '04 Sep 2024, 13:45 WIB',
            'INCOMING'),
      ],
    );
  }

  Widget _buildNewsItem(
      String imagePath, String headline, String dateTime, String status) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headline,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    dateTime,
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Shop'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.blue[800],
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    );
  }
}