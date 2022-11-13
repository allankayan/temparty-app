import 'package:equatable/equatable.dart';

class EventModel extends Equatable {
  String? eventUid;
  String? name;
  String? profileImage;
  String? headerImage;
  String? organizerUid;
  String? placeName;
  String? placeAddress;
  String? placeUf;
  String? placeZipcode;
  String? placeNumber;
  String? placeCity;
  String? date;
  String? observations;

  EventModel({
    this.eventUid,
    this.name,
    this.profileImage,
    this.headerImage,
    this.organizerUid,
    this.placeName,
    this.placeAddress,
    this.placeUf,
    this.placeZipcode,
    this.placeNumber,
    this.placeCity,
    this.date,
    this.observations,
  });

  EventModel.fromJson(Map<dynamic, dynamic>? json) {
    if (json == null) {
      return;
    }
    eventUid = json['eventUid'];
    name = json['name'];
    profileImage = json['profileImage'];
    headerImage = json['headerImage'];
    organizerUid = json['organizerUid'];
    placeName = json['placeName'];
    placeAddress = json['placeAddress'];
    placeUf = json['placeUf'];
    placeZipcode = json['placeZipcode'];
    placeNumber = json['placeNumber'];
    placeCity = json['placeCity'];
    date = json['date'];
    observations = json['observations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventUid'] = eventUid;
    data['name'] = name;
    data['profileImage'] = profileImage;
    data['headerImage'] = headerImage;
    data['organizerUid'] = organizerUid;
    data['placeName'] = placeName;
    data['placeAddress'] = placeAddress;
    data['placeUf'] = placeUf;
    data['placeZipcode'] = placeZipcode;
    data['placeNumber'] = placeNumber;
    data['placeCity'] = placeCity;
    data['date'] = date;
    data['observations'] = observations;
    return data;
  }

  EventModel copyWith({
    String? eventUid,
    String? name,
    String? profileImage,
    String? headerImage,
    String? organizerUid,
    String? placeName,
    String? placeAddress,
    String? placeUf,
    String? placeZipcode,
    String? placeNumber,
    String? placeCity,
    String? date,
    String? observations,
  }) {
    return EventModel(
      eventUid: eventUid ?? this.eventUid,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      headerImage: headerImage ?? this.headerImage,
      organizerUid: organizerUid ?? this.organizerUid,
      placeName: placeName ?? this.placeName,
      placeAddress: placeAddress ?? this.placeAddress,
      placeUf: placeUf ?? this.placeUf,
      placeZipcode: placeZipcode ?? this.placeZipcode,
      placeNumber: placeNumber ?? this.placeNumber,
      placeCity: placeCity ?? this.placeCity,
      date: date ?? this.date,
      observations: observations ?? this.observations,
    );
  }

  @override
  List<Object?> get props => [
        eventUid,
        name,
        profileImage,
        headerImage,
        organizerUid,
        placeName,
        placeAddress,
        placeUf,
        placeZipcode,
        placeNumber,
        placeCity,
        date,
        observations,
      ];
}
