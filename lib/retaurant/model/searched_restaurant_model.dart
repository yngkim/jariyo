//data Modeling
class SearchedRestaurantModel {
  final int rid;

  final String rname;

  final String pnumber;

  final String address;

  final String opentime;

  final String closetime;

  SearchedRestaurantModel({
    required this.rid,
    required this.rname,
    required this.pnumber,
    required this.address,
    required this.opentime,
    required this.closetime,
  });
  factory SearchedRestaurantModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return SearchedRestaurantModel(
      rid: json['rid'],
      rname: json['rname'],
      pnumber: json['pnumber'],
      address: json['address'],
      opentime: json['opentime'],
      closetime: json['closetime'],
    );
  }
}
