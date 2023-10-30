import 'package:flutter/material.dart';
import 'package:uts/app/widgets/navbar.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Transaction History',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Color.fromARGB(255, 244, 0, 0),
              tabs: [
                Tab(
                  child: Text('Pending',
                      style:
                          TextStyle(color: Colors.black, fontFamily: 'Inter')),
                ),
                Tab(
                  child: Text('Done', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Tab "Pending"
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Gambar dari internet yang ingin ditampilkan di tengah
                    Image.network(
                      'data:image/png;base64,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',
                      width: 190, // Sesuaikan lebar gambar sesuai kebutuhan
                      height: 190, // Sesuaikan tinggi gambar sesuai kebutuhan
                    ),
                    SizedBox(height: 35),

                    Text(
                      'All Transaction is Completed!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Any pending transaction will appear in this page',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),

              // Tab "Done"
              Center(
                child: Text('Transaction is Completed!'),
              ),
            ],
          ),
          bottomNavigationBar: Navbar(),
        ),
      ),
    );
  }
}
