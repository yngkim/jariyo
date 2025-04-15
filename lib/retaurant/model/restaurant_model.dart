//data Modeling
class RestaurantModel {
  final int rid;

  final String rname;

  final String pnumber;

  final String address;

  final String opentime;

  final String closetime;

  RestaurantModel({
    required this.rid,
    required this.rname,
    required this.pnumber,
    required this.address,
    required this.opentime,
    required this.closetime,
  });

  factory RestaurantModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return RestaurantModel(
      rid: json['rid'],
      rname: json['rname'],
      pnumber: json['pnumber'],
      address: json['address'],
      opentime: json['opentime'],
      closetime: json['closetime'],
    );
  }
}


// factory SearchedRestaurantModel.fromJson({
//     required FutureOr<List<dynamic>> json,
//   }){
//     return SearchedRestaurantModel(
//       rid: json['rid'],
//       rname: json['rname'],
//       pnumber: json['pnumber'],
//       address: json['address'],
//       opentime: json['opentime'],
//       closetime: json['closetime'],
//     );
//   }