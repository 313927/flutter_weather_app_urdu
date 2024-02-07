import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/bloc/my_weather_bloc.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget getWeatherIcon(int code){
    switch(code){
      case >= 200 && < 300:
      return Image.network('https://openweathermap.org/img/wn/11d@2x.png');
      case >= 300 && < 400:
      return Image.network('https://openweathermap.org/img/wn/09d@2x.png');
      case >= 400 && < 500:
      return Image.network('https://openweathermap.org/img/wn/10d@2x.png');
      case >= 500 && < 600:
      return Image.network('https://openweathermap.org/img/wn/13d@2x.png');
      case >= 600 && < 700:
      return Image.network('https://openweathermap.org/img/wn/50d@2x.png');
      case >= 700 && < 800:
      return Image.network('https://openweathermap.org/img/wn/01d@2x.png');
      case >= 800 && < 900:
      return Image.network('https://openweathermap.org/img/wn/03d@2x.png');
      default:
      return Image.asset('assets/thunder1.png');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar:  AppBar(
      //   backgroundColor: Colors.transparent,
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarBrightness: Brightness.dark,
      //   ),
      // ),
      body:  Padding(
        padding: const EdgeInsets.fromLTRB(25, 1.2 * kToolbarHeight, 35, 20),
        child: BlocBuilder<MyWeatherBloc, MyWeatherState>(
             builder: (context, state) {
              // var x = state.
               if(state is MyWeatherSuccessState) {

                 return SizedBox(
                    height: MediaQuery.of(context).size.height,
                   child: Stack(
                     children: [
                       Align(
                         alignment: const AlignmentDirectional(6, -0.2),
                         child: Container(
                           height: 400,
                           width: 300,
                           decoration: const BoxDecoration(
                               shape: BoxShape.circle,
                               color: Colors.deepPurpleAccent
                           ),
                         ),
                       ),
                       Align(
                         alignment: const AlignmentDirectional(-6, -0.2),
                         child: Container(
                           height: 400,
                           width: 300,
                           decoration: const BoxDecoration(
                               shape: BoxShape.circle,
                               color: Colors.deepPurple
                           ),
                         ),
                       ),
                       Align(
                         alignment: const AlignmentDirectional(0, -1.7),
                         child: Container(
                           height: 300,
                           width: 300,
                           decoration: const BoxDecoration(
                             //shape: BoxShape.circle,
                               color: Colors.yellow
                           ),
                         ),
                       ),
                       BackdropFilter(
                         filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 120.0),
                         child: Container(
                           decoration: const BoxDecoration(
                               color: Colors.transparent
                           ),
                         ),
                       ),
                       SizedBox(
                         height: MediaQuery
                             .of(context)
                             .size
                             .height,
                         width: MediaQuery
                             .of(context)
                             .size
                             .width,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                              Row(
                                children: [
                                  const Icon(Icons.location_on, color: Colors.white,),
                                  Text(
                                   state.myWeather.areaName!,
                                   style: const TextStyle(
                                     fontSize: 13,
                                     color: Colors.white,
                                     fontWeight: FontWeight.w300,
                                   ),
                             ),
                                ],
                              ),
                             const SizedBox(height: 8.0),
                              Text(
                               state.myWeather.weatherMain!.toString().toUpperCase(),
                               style: const TextStyle(
                                 fontSize: 25,
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                             const SizedBox(height: 15,),
                             Center(
                               child: SizedBox(
                                 height: 200,
                                 width: 200,
                                 child: getWeatherIcon(state.myWeather.weatherConditionCode!)
                                 // Image.asset(
                                 //   'assets/thunder1.png',
                                 // ),
                               ),
                             ),
                             const SizedBox(height: 15,),
                              Center(
                               child: Text(
                                 '${state.myWeather.temperature!.celsius!.round()} °C',
                                 style: const TextStyle(
                                   fontWeight: FontWeight.w600,
                                   color: Colors.white,
                                   fontSize: 50,
                                 ),
                               ),
                             ),
                              Center(
                               child: Text(
                                 state.myWeather.weatherDescription!.toString().toUpperCase(),
                                 style: const TextStyle(
                                   fontWeight: FontWeight.w500,
                                   color: Colors.white,
                                   fontSize: 30,
                                 ),
                               ),
                             ),
                             const SizedBox(height: 5.0,),
                              Center(
                               child: Text(
                                 DateFormat('EE dd | h:mm a').format(state.myWeather.date!),
                                 style: const TextStyle(
                                   fontWeight: FontWeight.w300,
                                   color: Colors.white,
                                   fontSize: 15,
                                 ),
                               ),
                             ),
                             const SizedBox(height: 30,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment
                                   .spaceBetween,
                               children: [
                                 Row(
                                   children: [
                                     SizedBox(
                                       width: 80,
                                       height: 50,
                                       child: Image.asset(
                                           'assets/sunrise1.png',
                                           scale: 8
                                       ),
                                     ),
                                     const SizedBox(width: 5,),
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment
                                           .start,
                                       children: [
                                         const Text(
                                           "Sunrise",
                                           style: TextStyle(
                                             fontWeight: FontWeight.w300,
                                             color: Colors.white,
                                           ),
                                         ),
                                         const SizedBox(height: 3,),
                                         Text(
                                          DateFormat('h:mm a').format( state.myWeather.sunrise!),
                                           style: const TextStyle(
                                             fontWeight: FontWeight.w300,
                                             color: Colors.white,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     SizedBox(
                                       width: 80,
                                       height: 50,
                                       child: Image.asset(
                                           'assets/sunset1.png',
                                           scale: 8
                                       ),
                                     ),
                                     const SizedBox(width: 7,),
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment
                                           .start,
                                       children: [
                                         const Text(
                                           "Sunset     ",
                                           style: TextStyle(
                                             fontWeight: FontWeight.w300,
                                             color: Colors.white,
                                           ),
                                         ),
                                         const SizedBox(height: 3,),
                                         Text(
                                           DateFormat('h:mm a').format(state.myWeather.sunset!),
                                           style: const TextStyle(
                                             fontWeight: FontWeight.w300,
                                             color: Colors.white,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                             const SizedBox(height: 15,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment
                                   .spaceBetween,
                               children: [
                                 Row(
                                   children: [
                                     SizedBox(
                                       width: 80,
                                       height: 50,
                                       child: Image.asset(
                                           'assets/tempMax.png',
                                           scale: 8
                                       ),
                                     ),
                                     const SizedBox(width: 0,),
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment
                                           .start,
                                       children: [
                                         const Text(
                                           "Temp Max",
                                           style: TextStyle(
                                             fontWeight: FontWeight.w300,
                                             color: Colors.white,
                                           ),
                                         ),
                                         const SizedBox(height: 3,),
                                         Text(
                                           '${state.myWeather.tempMax!.celsius!.round()}°C',
                                           style: const TextStyle(
                                             fontWeight: FontWeight.w300,
                                             color: Colors.white,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     SizedBox(
                                       width: 80,
                                       height: 50,
                                       child: Image.asset(
                                           'assets/temMin.png',
                                           scale: 8
                                       ),
                                     ),
                                     const SizedBox(width: 0,),
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment
                                           .start,
                                       children: [
                                         const Text(
                                           "Temp Min   ",
                                           style: TextStyle(
                                             fontWeight: FontWeight.w300,
                                             color: Colors.white,
                                           ),
                                         ),
                                         const SizedBox(height: 3,),
                                         Text(
                                           '${state.myWeather.tempMin!.celsius!.round()}°C',
                                           style: const TextStyle(
                                             fontWeight: FontWeight.w300,
                                             color: Colors.white,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                             const SizedBox(height: 10,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Row(
                                   children: [
                                     SizedBox(
                                       width: 80,
                                       height: 50,
                                       child: Image.asset(
                                           'assets/humidity.png',
                                           scale: 8
                                       ),
                                     ),
                                     const SizedBox(width: 0,),
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment
                                           .start,
                                       children: [
                                         const Text(
                                           "Humidity",
                                           style: TextStyle(
                                             fontWeight: FontWeight.w300,
                                             color: Colors.white,
                                           ),
                                         ),
                                         const SizedBox(height: 3,),
                                         Text(
                                           '${state.myWeather.humidity!}%',
                                           style: const TextStyle(
                                             fontWeight: FontWeight.w300,
                                             color: Colors.white,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     SizedBox(
                                       width: 80,
                                       height: 50,
                                       child: Image.asset(
                                           'assets/windspeed.png',
                                           scale: 8
                                       ),
                                     ),
                                     const SizedBox(width: 0,),
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment
                                           .start,
                                       children: [
                                         const Text(
                                           "wind speed",
                                           style: TextStyle(
                                             fontWeight: FontWeight.w300,
                                             color: Colors.white,
                                           ),
                                         ),
                                         const SizedBox(height: 3,),
                                         Text(
                                           '${state.myWeather.windSpeed}km/h',
                                           style: const TextStyle(
                                             fontWeight: FontWeight.w300,
                                             color: Colors.white,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                               ],
                             ),

                           ],
                         ),
                       ),

                     ],
                   ),
                 );
               } else {
                 return Container();
               }
          },
),
      ),
    );
  }
}
