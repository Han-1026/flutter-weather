import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_project/model/model.dart';
import 'package:flutter_svg/flutter_svg.dart';





class HomeScreen extends StatefulWidget {
  final dynamic parseWeatherData;
  final dynamic parseAirData;
  final dynamic parseWeeklyData;
  HomeScreen({ this.parseWeatherData, this.parseAirData, this.parseWeeklyData});
  

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Model model = Model();
  final controller = ScrollController();
  double offset = 0;
  late String cityName;
  late int temp;
  late String des;
  late double dust1;
  late double dust2;
  late Widget airState;
  late Widget airIcon;
  late Widget icon;
  late Widget wicon;
  late Widget bgi;
  
  var date = DateTime.now();
 
  late List <dynamic> sevendays;
  //late Map<String, double> seventemp;
 //late List<double> seventemp;
  late List<dynamic> sevenmintemp;
  late List<dynamic> sevenmaxtemp;
  //var sevenmintemp;
  //var sevenmaxtemp;
  late List<dynamic> sevenid;
  // var sevenid;
  


  @override
  void initState(){
    super.initState();
    controller.addListener(onScroll);
    updateData(widget.parseWeatherData, widget.parseAirData, widget.parseWeeklyData);
  }
  
  void updateData(dynamic weatherData, dynamic airData, dynamic weeklyData) {
    cityName = weatherData['name'];
    if(cityName == 'Seoul'){
         cityName = '서울';
    }
    double temp2 = weatherData['main']['temp'].toDouble();
    int condition = weatherData['weather'][0]['id'];
    int index = airData['list'][0]['main']['aqi'];
    des = weatherData['weather'][0]['description'];
    if(des == 'clear sky'){
      des = '맑음';
    }else if(des == 'few clouds'){
      des ='구름 조금';
    }else if(des == 'broken clouds'){
      des ='뭉게 구름';
    }else if(des == 'overcast clouds'){
      des ='흐린 구름';
    }
    dust1 = airData['list'][0]['components']['pm10'];
    dust2 = airData['list'][0]['components']['pm2_5'];

    temp = temp2.round();
    icon = model.getWeatherIcon(condition);
    airIcon = model.getAirIcon(index);
    airState = model.getAirCondition(index);
    bgi = model.backgroundimage(condition);
    
  //  cbgi = model.cardbackgroundimage(condition);
    
    sevendays = [];
    for(int i = 1; i < 8; i++){
      sevendays.add((weeklyData['daily'][i]['dt']),);
       print((weeklyData['daily'][i]['dt']));
     // sevendays.add(weeklyData['daily'][i]['temp']['day']);
      print(sevendays);
    }
     sevenmintemp = [];
    for(int i = 1; i< 8; i++){
      sevenmintemp.add((weeklyData['daily'][i]['temp']['min']));
    }
      sevenmaxtemp = [];
    for(int i = 1; i< 8; i++){
      sevenmaxtemp.add((weeklyData['daily'][i]['temp']['max']));
    }
    //print(sevendays);
 //   int wcondition = sevenid[0];
    sevenid = [];
     for(int i = 1; i< 8; i++){
      sevenid.add((weeklyData['daily'][i]['weather'][0]['id']));
      
      print(sevenid);
       
    
    }
    int wcondition = sevenid[0];
    wicon = model.getWeekIcon(wcondition);
   // wicon = model.getWeekIcon(wcondition);

    // sevenid.forEach((element) {
    //  if (element < 300) {
    //   return SvgPicture.asset(
    //     'svg/climacon-colud_lightning.svg',
    //     color: Colors.yellow[700],
    //   );
    //  }     
    // });

  
    print(temp);
    print(cityName);
  }


   String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }


  @override
   void dispose() {
   
    controller.dispose();
    super.dispose();
  }
  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0; //컨트롤 종료위치가 오프셋
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(      
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.location_searching,
            ),
            onPressed: () {},
            iconSize: 30.0,
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            bgi,
            Container(
               decoration: BoxDecoration(color: Colors.black38),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100.0,
                            ),
                            Column(
                              children: [
                                  Text(
                                  '(현재 위치)',
                                  style: GoogleFonts.lato(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],

                            ),
                            Row(
                              children: [
                                Text(
                                  '$cityName',
                                  style: GoogleFonts.lato(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                       icon,
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '$des',
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                  (Duration(minutes: 1)),
                                  builder: (context) {
                                    print('${getSystemTime()}');
                                    return Text(
                                      '${getSystemTime()}',
                                      style: GoogleFonts.lato(
                                          fontSize: 16.0, color: Colors.white),
                                    );
                                  },                     
                                ),
                                  Text(DateFormat(' - EEE,d MMM, yyy ').format(date),                         
                                    style: GoogleFonts.lato(
                                        fontSize: 16.0, color: Colors.white)),
                              
                                // Text(DateFormat('d MMM, yyy').format(date),
                                //     style: GoogleFonts.lato(
                                //         fontSize: 16.0, color: Colors.white))
                              ],
                            ),
                             Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                      
                            Column(
                              children: [
                                      Text(
                              '$temp\u2103',
                              style: GoogleFonts.lato(
                                  fontSize: 65.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                                   Text(
                               '일별예보',
                              style: GoogleFonts.lato(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey[900]),

                            ),                            
                              ],
                              
                            ),
              
                                 Divider(
                        height: 15.0,
                        thickness: 2.0,
                        color: Colors.white30,
                      ),
                           Container(
                           width: double.infinity,
                           height: 140,
                           child: ListView.builder(                      
                           scrollDirection: Axis.horizontal,
                           padding: const EdgeInsets.all(8),
                           itemCount: sevendays.length,
                           itemBuilder: (BuildContext context, int index){
                                                  String getDate(){
                 var date = DateTime.fromMillisecondsSinceEpoch(sevendays[index] * 1000);
                return(DateFormat('EEE').format(date));
                    }
 
                            return Container(
                                             
                              child: Card(  
                                                                                        
      color: Colors.transparent,
      elevation: 0,
      // shape: RoundedRectangleBorder(
      //  // side: BorderSide(color: Colors.black, width:1),
      //   borderRadius: BorderRadius.circular(8),
      // ),
      child: InkWell(
        splashColor: Colors.white,
        onTap: (){
          print('$index번 타일 클릭됨');
        },
    child: SizedBox(
      
         width: 100,
         height: 50,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Container(
               width: double.infinity,   // like Match_parent in Android
               height: 100,
               alignment: Alignment.center,
             //  color: Colors.red[50],
               child: Column(
                 children: [
                   Text(
                          getDate(),
                     style: GoogleFonts.lato(
                       fontSize: 20.0,
                       fontWeight: FontWeight.bold,
                       color: Colors.white,
                                               
                    ),
                   ),
                   Text(
                     "최저:${sevenmintemp[index].round()}\u2103",
                     style: GoogleFonts.lato(
                       fontSize: 13.0,
                       fontWeight: FontWeight.normal,
                       color: Colors.white,
                     ),
                   ),
                          Text(
                     "최고:${sevenmaxtemp[index].round()}\u2103",
                     style: GoogleFonts.lato(
                       fontSize: 13.0,
                       fontWeight: FontWeight.normal,
                       color: Colors.white,
                     ),                     
                   ),
                   wicon,
                 ],
               ),
             ),          
           ],
         ),
        ),
      ),
    ),
                            );
                         }
                       ),
                      ),                            
                     ],                         
                   )                 
                 ],                     
              ),
                                        
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Divider(
                        height: 15.0,
                        thickness: 2.0,
                        color: Colors.white30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'AQI(대기질지수)',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              airIcon,
                              SizedBox(
                                height: 10.0,
                              ),
                              airState,
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '미세먼지',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '$dust1',
                                style: GoogleFonts.lato(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '㎍/m3',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '초미세먼지',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '$dust2',
                                style: GoogleFonts.lato(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '㎍/m3',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
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
    );
  }

}






