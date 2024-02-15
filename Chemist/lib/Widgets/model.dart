class Model {
    String? scientific;
    String? commercial;
    int? category_id;
    String? company;
    int? quantity;
    String? date;
    int? price;
    bool favoirte=false;
    int? drugId;
    Model({required this.category_id,
      required this.price,
      required this.commercial,
      required this.company,
      required this.date,required this.quantity
      ,required this.scientific,
    required this.drugId
    });

    factory Model.fromjson(json){
      return Model(
          drugId: json['id'],
          category_id:json['category_id'],
          price: json['price'],
          commercial: json['tradeName'],
          company: json['companyName'],
          date: json['updated_at'],
          quantity: json['quantity'],
          scientific: json['scientificName']);
    }

}
class ModelOrder {
  String? scientific;
  dynamic? quantity;
  String? status;
  String? statusPayment;
  ModelOrder({
    required this.statusPayment,
    required this.status,
    required this.quantity
    ,required this.scientific});

  factory ModelOrder.fromjson(json){
    return ModelOrder(
        statusPayment: json['statusPayment'],
        status:json['status'],
        quantity: json['quantity'],
        scientific: json['scientificName']);
  }
}
class ModelNotify{
    int ? number;
    String? status;

  ModelNotify({
    required this.number,
    required this.status,
  });

  factory ModelNotify.fromjson(json){
    return ModelNotify(
        status: json['new_status'],
        number:json['order_id'],
      );
  }

}