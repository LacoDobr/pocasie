import 'condition.dart';

class Current {
  int? lastUpdatedEpoch;
  double? tempC;
  int? isDay;
  Condition? condition;
  double? windKph;
  int? windDegree;
  double? pressureMb;
  double? precipMm;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? visKm;
  double? uv;

  Current({
    this.lastUpdatedEpoch,
    this.tempC,
    this.isDay,
    this.condition,
    this.windKph,
    this.windDegree,
    this.pressureMb,
    this.precipMm,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.visKm,
    this.uv,
  });

  void specifyValues(
      Map<String, dynamic> jsonMain,
      Map<String, dynamic> jsonWind,
      Map<String, dynamic> jsonClouds,
      Map<String, dynamic> jsonW) {
    if (jsonMain['temp'] != null) {
      if (tempC == null) {
        tempC = (jsonMain['temp'] as num?)?.toDouble();
      } else {
        tempC = (tempC! + (jsonMain['temp'] as num?)!.toDouble()) / 2;
      }
    }
    if (jsonMain['feels_like'] != null) {
      if (feelslikeC == null) {
        feelslikeC = (jsonMain['feels_like'] as num?)?.toDouble();
      } else {
        feelslikeC =
            (feelslikeC! + (jsonMain['feels_like'] as num?)!.toDouble()) / 2;
      }
    }
    if (jsonMain['pressure'] != null) {
      if (pressureMb == null) {
        pressureMb = (jsonMain['pressure'] as num?)?.toDouble();
      } else {
        pressureMb =
            (pressureMb! + (jsonMain['pressure'] as num?)!.toDouble()) / 2;
      }
    }
    if (jsonMain['humidity'] != null) {
      if (humidity == null) {
        humidity = jsonMain['humidity'] as int?;
      } else {
        humidity = (humidity! + jsonMain['humidity'] as int?)! ~/ 2;
      }
    }
    if (jsonWind['speed'] != null) {
      if (windKph == null) {
        windKph = (jsonWind['speed'] as num?)!.toDouble();
      } else {
        windKph = (windKph! + (jsonWind['speed'] as num?)!.toDouble()) / 2;
      }
    }
    if (jsonWind['deg'] != null) {
      if (windDegree == null) {
        windDegree = jsonWind['deg'] as int?;
      } else {
        windDegree = (windDegree! + jsonWind['deg'] as int?)! ~/ 2;
      }
    }
    if (jsonClouds['all'] != null) {
      if (cloud == null) {
        cloud = jsonClouds['all'] as int?;
      } else {
        cloud = (cloud! + jsonClouds['all'] as int?)! ~/ 2;
      }
    }
    condition!.specifyValues(jsonW['main'] as String?);
  }

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json['last_updated_epoch'] as int?,
        tempC: (json['temp_c'] as num?)?.toDouble(),
        isDay: json['is_day'] as int?,
        condition: json['condition'] == null
            ? Condition.fromJson(<String, dynamic>{})
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        windKph: (json['wind_kph'] as num?)?.toDouble(),
        windDegree: json['wind_degree'] as int?,
        pressureMb: (json['pressure_mb'] as num?)?.toDouble(),
        precipMm: (json['precip_mm'] as num?)?.toDouble(),
        humidity: json['humidity'] as int?,
        cloud: json['cloud'] as int?,
        feelslikeC: (json['feelslike_c'] as num?)?.toDouble(),
        visKm: (json['vis_km'] as num?)?.toDouble(),
        uv: (json['uv'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'last_updated_epoch': lastUpdatedEpoch,
        'temp_c': tempC,
        'is_day': isDay,
        'condition': condition?.toJson(),
        'wind_kph': windKph,
        'wind_degree': windDegree,
        'pressure_mb': pressureMb,
        'precip_mm': precipMm,
        'humidity': humidity,
        'cloud': cloud,
        'feelslike_c': feelslikeC,
        'vis_km': visKm,
        'uv': uv,
      };
}
