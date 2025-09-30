import 'package:flutter/material.dart';
import 'package:login/data/game_store_data.dart';
import 'package:login/screens/gamedetail_page.dart';
import 'package:login/screens/login_page.dart';
import 'package:login/screens/profile_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halo Home Page"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton
          (onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder:(context){
                return ProfilePage();
              }
            ));
          },
          icon: Icon(Icons.person),
          ),
          IconButton
          (onPressed: (){
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder:(context){
                return LoginPage();
              }
            ),
            (route)=>false
            );
          },
          icon: Icon(Icons.logout_outlined, color: Colors.red),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("hallo, $username"),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16
                  ), 
                itemBuilder: (context, index){
                  return _gameStore(context, index);
                },
                itemCount: gameList.length,
            
              )
              )
          ],
        ),
      ),
    );
  }



  Widget _gameStore(BuildContext context, int index){
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context)=> GameDetailPage(game: gameList[index])
          )
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color : Colors.deepPurpleAccent,
          border: Border.all(width: 2)
        ),
        child: Column(
          children: [
            Image.network(
              gameList[index].imageUrls[0]
            ),
            Text(gameList[index].name),
            Text("Review : ${gameList[index].reviewAverage}")
          ],
        ),
      ),
    );
  }
}