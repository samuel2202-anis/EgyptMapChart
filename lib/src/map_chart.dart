import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'model.dart';

class EgyptMapChart extends StatelessWidget {
  /// The data to be displayed on the map
  final List<RegionData> data;
  
  /// Base color for the heat map
  final Color baseColor;
  
  /// Custom height for the map chart
  final double? height;
  
  /// Custom tooltip builder
  final Widget Function(BuildContext, RegionData)? tooltipBuilder;

  const EgyptMapChart({
    super.key, 
    required this.data,
    this.baseColor = Colors.red,
    this.height,
    this.tooltipBuilder,
  });

  /// Calculate color shade based on value
  Color _getColorShade(double value) {
    // Find the maximum value in the dataset
    final maxValue = data.map((e) => e.value).reduce((a, b) => a > b ? a : b);

    // Calculate opacity based on value (0.2 to 1.0 range)
    final opacity = 0.2 + ((value / maxValue) * 0.8);
    
    return baseColor.withOpacity(opacity);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? MediaQuery.of(context).size.height / 2,
      child: Center(
        child: SfMaps(
          layers: <MapShapeLayer>[
            MapShapeLayer(
              source: MapShapeSource.asset(
                'assets/egypt.json',
                shapeDataField: 'adm2',
                dataCount: data.length,
                primaryValueMapper: (int index) => data[index].state,
                dataLabelMapper: (int index) => data[index].stateCode,
                shapeColorValueMapper: (int index) => _getColorShade(data[index].value),
              ),
              showDataLabels: true,
              tooltipSettings: const MapTooltipSettings(
                color: Colors.white,
                strokeColor: Colors.grey,
                strokeWidth: 1.5,
              ),
              strokeColor: Colors.white,
              strokeWidth: 0.5,
              shapeTooltipBuilder: (context, index) {
                if (tooltipBuilder != null) {
                  return tooltipBuilder!(context, data[index]);
                }
                return _defaultTooltipBuilder(context, data[index]);
              },
              dataLabelSettings: const MapDataLabelSettings(
                textStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _defaultTooltipBuilder(BuildContext context, RegionData regionData) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            regionData.stateCode,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            regionData.value.toStringAsFixed(1),
            style: const TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}