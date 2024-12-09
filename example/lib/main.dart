import 'package:egypt_map_chart/egypt_map_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the map
    final data = [
      RegionData(state: 'Al Iskandariyah (Alex.)', stateCode: 'الاسكندرية', value: 900),
      RegionData(state: 'Aswan', stateCode: 'اسوان', value: 800),
      RegionData(state: 'Asyiut', stateCode: 'اسيوط', value: 700),
      RegionData(state: 'Al Buhayrah (Behera)', stateCode: 'البحيرة', value: 600),
      RegionData(state: 'Beni Suwayf (Beni-Suef)', stateCode: 'بني سويف', value: 500),
      RegionData(state: 'Al Qahirah (Cairo)', stateCode: 'القاهرة', value: 400),
      RegionData(state: 'Al Daqahliyah (Dakahlia)', stateCode: 'الدقهلية', value: 300),
      RegionData(state: 'Dumyat (Damietta)', stateCode: 'دمياط', value: 200),
      RegionData(state: 'Al Fayyum (Fayoum)', stateCode: 'الفيوم', value: 100),
      RegionData(state: 'Al Gharbiyah (Gharbia)', stateCode: 'الغربية', value: 950),
      RegionData(state: 'Al Jizah (Giza)', stateCode: 'الجيزة', value: 850),
      RegionData(state: 'As Ismailiyah (Ismailia)', stateCode: 'الاسماعيلية', value: 750),
      RegionData(state: 'Kafr-El-Sheikh', stateCode: 'كفر الشيخ', value: 650),
      RegionData(state: 'Luxor', stateCode: 'الاقصر', value: 550),
      RegionData(state: 'Matruh', stateCode: 'مطروح', value: 450),
      RegionData(state: 'Al Minya (Menia)', stateCode: 'المنيا', value: 350),
      RegionData(state: 'Al Minufiyah (Menoufia)', stateCode: 'المنوفية', value: 250),
      RegionData(state: 'Al Wadi/Al Jadid', stateCode: 'الوادي الجديد', value: 150),
      RegionData(state: 'Shamal Sina (North Sinai)', stateCode: 'شمال سيناء', value: 50),
      RegionData(state: 'Bur Said (Port Said)', stateCode: 'بورسعيد', value: 850),
      RegionData(state: 'Al Qalyubiyah (Kalyoubia)', stateCode: 'القليوبية', value: 950),
      RegionData(state: 'Qina', stateCode: 'قنا', value: 1050),
      RegionData(state: 'Al Bahr/Al Ahmar (RedSea)', stateCode: 'البحر الاحمر', value: 1150),
      RegionData(state: 'Ash Sharqiyah (Sharkia)', stateCode: 'الشرقية', value: 1250),
      RegionData(state: 'Suhaj', stateCode: 'سوهاج', value: 1350),
      RegionData(state: 'Janub Sina (South Sinai)', stateCode: 'جنوب سيناء', value: 1450),
      RegionData(state: 'As Suways (Suez)', stateCode: 'السويس', value: 1550),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Egypt Map Chart', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.red[700]!,),
        body: Center(
          child: EgyptMapChart(
            data: data,
            baseColor: Colors.red, // You can change this to any color
            tooltipBuilder: (context, region) { // you can customize it as you want
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(region.stateCode, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    const SizedBox(height: 4),
                    Text('الكمية: ${region.value}', style: const TextStyle(fontSize: 11)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
} 