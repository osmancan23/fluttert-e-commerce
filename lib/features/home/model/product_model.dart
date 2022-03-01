import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'product_model.g.dart';

@JsonSerializable(createToJson: false)
class ProductModel extends INetworkModel with EquatableMixin {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  RatingModel? rating;

  ProductModel({this.id, this.title, this.price, this.description, this.category, this.image, this.rating});

  @override
  fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

  @override
  List<Object?> get props => [id, price];

  @override
  Map<String, dynamic>? toJson() {
    return null;
  }
}

@JsonSerializable(createToJson: false)
class RatingModel {
  double? rate;
  int? count;

  RatingModel({this.rate, this.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return _$RatingModelFromJson(json);
  }
}
