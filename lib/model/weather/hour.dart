import 'condition.dart';

class Hour {
  int? timeEpoch;
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
  int? willItRain;
  int? chanceOfRain;
  int? willItSnow;
  int? chanceOfSnow;
  double? visKm;
  double? uv;

  Hour({
    this.timeEpoch,
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
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.uv,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        timeEpoch: json['time_epoch'] as int?,
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
        willItRain: json['will_it_rain'] as int?,
        chanceOfRain: json['chance_of_rain'] as int?,
        willItSnow: json['will_it_snow'] as int?,
        chanceOfSnow: json['chance_of_snow'] as int?,
        visKm: (json['vis_km'] as num?)?.toDouble(),
        uv: (json['uv'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'time_epoch': timeEpoch,
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
        'will_it_rain': willItRain,
        'chance_of_rain': chanceOfRain,
        'will_it_snow': willItSnow,
        'chance_of_snow': chanceOfSnow,
        'vis_km': visKm,
        'uv': uv,
      };
}
