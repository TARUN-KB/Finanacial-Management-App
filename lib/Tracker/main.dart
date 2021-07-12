import 'package:flutter/material.dart';
import 'package:projectpractice/dashboard.dart';

void main() {
  runApp((MaterialApp(
    debugShowCheckedModeBanner: false,
    home: tracker(),
  )));
}

class tracker extends StatefulWidget {
  const tracker({Key? key}) : super(key: key);

  @override
  _trackerState createState() => _trackerState();
}

class _trackerState extends State<tracker> {
  List<String> Months=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  int _counter=0;
  int _currentindex=0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('reach',style: TextStyle(fontSize: 45,fontFamily: 'teko'),),
          centerTitle: true,
            actions: [
            IconButton(onPressed: (){},icon: Icon(
            Icons.qr_code
      ),
      ),
      ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,//label
            indicatorWeight: 3,
            //unselectedLabelStyle: TextStyle(color: Colors.white),
            unselectedLabelColor: Colors.white,
            labelColor: Colors.black,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              /*image: BoxDecoration(
                   image: AssetImage('images/mypic.jpg'),
                   fit:BoxFit.fitWidth
                 ),*/
              color: Colors.white,
            ),
            tabs: [
              Tab(child: Text("Tracker",style: TextStyle(fontSize: 20),)),
              Tab(child: Text("Community",style: TextStyle(fontSize: 20),)),
              Tab(child: Text("Explore",style: TextStyle(fontSize: 20),)),


            ],
          ),
        ),
       drawer: dashboard(),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 30,),
              Center(
                child: SizedBox(
                  height: 25,
                  width: 250,
                  child: ElevatedButton(onPressed: (){},

                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.green[800]),

                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                          )
                        )
                      ), child: null,

                      ),
                ),
              ),
              Row(
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      if(_counter!=0)
                        {
                          _counter-=1;
                        }
                      else{
                        _counter=11;
                      }
                    });
                  },
                      icon: Icon(Icons.arrow_left,color: Colors.blue[900],size: 35,))  ,

                  Text(Months[_counter],style: TextStyle(color: Colors.blue[900],fontSize: 20),),

                  IconButton(onPressed: (){
                    setState(() {
                      if(_counter!=11)
                      {
                        _counter+=1;
                      }
                      else{
                        _counter=0;
                      }
                    });
                  },
                      icon: Icon(Icons.arrow_right,color: Colors.blue[900],size: 35,))  ,
                ],
              ),
              Image.asset("images/fingraph.jpg"),

              Center(
                child: FlatButton(onPressed: (){},
                    splashColor: Colors.black,
                    color: Colors.blue[900],

                    child: Text("New Payment",style: TextStyle(color: Colors.white,fontSize: 25),)),
              ),

              SizedBox(height: 20,),
              Center(child: Image.asset("images/piechart.jpg")),
              SizedBox(height: 20,),
              Text("Transaction History",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(height: 10,),
              Text("Account Balance",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
              Center(
                child: FlatButton(onPressed: (){},
                    color: Colors.blue[900],
                    splashColor: Colors.black,
                    child: Text("New Payment",style: TextStyle(color: Colors.white,fontSize: 25),)),
              ),
            ],
          ),
        ),

        ),
    );
  }
}
