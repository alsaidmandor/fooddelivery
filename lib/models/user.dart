class UserModel {
  String? uId;
  String? firstName;
  String? lastName;
  String? email;
  String? image;
  String? phone;
  String? address;

  UserModel({
    this.uId,
    this.email,
    this.firstName,
    this.lastName,
    this.image,
    this.phone,
    this.address,
  });

  UserModel.fromMap(Map<String, dynamic> json) {
    uId = json['uId'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    image = json['image'];
    phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toMap() => {
        'uId': uId,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'image': image,
        'phone': phone,
        'address': address,
      };
}
