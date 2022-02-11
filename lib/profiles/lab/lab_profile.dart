import 'package:flutter/material.dart';

class labProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Pathology Lab')),
        backgroundColor: Colors.grey,
        body: Column(

          children: [
            Row(

              children: [
                Container(
                    width: 180,
                    height: 180,
                    padding: EdgeInsets.all(20.0),
                    child: GestureDetector(child : Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),

                      ),
                      child:const Center(child: Text('Search Patient')),

                    ),onTap:(){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => SearchPage()));
                    } ,)),
                Container(
                    width: 180,
                    height: 180,
                    padding: EdgeInsets.all(20.0),
                    child: GestureDetector(child : Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),

                      ),
                      child:const Center(child: Text('Lab profile')),

                    ),onTap:(){
                      // Navigator.push(context,MaterialPageRoute(builder: (context) => SearchPage()));
                    } ,)),
              ],
            ),

          ],

        ),
      ),
    );  ;
  }

}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          )),
    );
  }
}