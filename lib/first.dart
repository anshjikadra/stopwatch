import 'package:flutter/material.dart';

class first extends StatefulWidget {

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  String stor="";

  int hour=0;
  int minute=0;
  int secound=0;
  bool st =false;
  //int milisecound=0;

  @override
  void initState() {
    watch().listen((event) {
      print("Time : $event");
    });

  }
  Stream<String>watch()

  async*{
      while(true)
        {
          await Future.delayed(Duration(seconds: 1));

          DateTime dt=DateTime.now();
          String time="${hour} : ${minute} : ${secound}";
          if(st)
            {

              secound++;
            }

           if(secound>=60)
            {

              secound=0;
              minute=minute+1;
            }
          if(minute>=60)
            {

              minute=0;
              hour=hour+1;
            }
          yield time;
        }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          height: double.infinity,
          width:double.infinity,
          color: Colors.black,
          child: Column(
            children: [
              Expanded(

                child: Container(
                  height:70,
                  width: double.infinity,
                  //color: Colors.deepPurple,
                  alignment: Alignment.center,
                  child: Text("StopWatch",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  //height:150,
                  //width: double.infinity,
                  //color: Colors.deepPurple,
                  alignment: Alignment.center,
                  child: StreamBuilder(stream: watch(),builder: (context, snapshot){
                    if(snapshot.connectionState==ConnectionState.done)
                      {
                        return CircularProgressIndicator();
                      }
                    else
                      {
                        return Center(child: Container(child: Text((true)?"Time: ${snapshot.data}" : "Welcome",style: TextStyle(color: Colors.white,fontSize: 35),)));
                      }

                  },)
                ),
              ),
              Expanded(flex: 4,
                  child: Container(
                    //color: Colors.deepPurple,
                    child:Center(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(onPressed: () {


                             st=true;
                            print(st);

                          }, child: Text("Start")),
                          ElevatedButton(onPressed: () {

                            setState(() {
                              st=false;
                              stor="${hour} : ${minute} : ${secound}";
                              hour=0;
                              secound=0;
                              minute=0;
                            });


                          }, child: Text("Stop")),
                          ElevatedButton(onPressed: () {

                          }, child: Text("Resume")),
                          ElevatedButton(onPressed: () {

                          }, child: Text("Reset")),
                        ],
                      ),
                    )
                  )),
              Expanded(child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.deepPurple[100],),
                alignment: Alignment.center,
                child: Text("${stor}",textAlign: TextAlign.center,style: TextStyle(fontSize: 40,color: Colors.red,fontWeight: FontWeight.bold),),),
              )

            ],
          ),
        )
      ),
    );
  }


}
