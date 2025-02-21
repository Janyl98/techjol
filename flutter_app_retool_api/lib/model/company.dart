class Company {
  int? id;
  String? companyName;
  String? companyAddress;
  String? companyNumber;
  String? companyLogo;
/*
   "id": 57,
    "logo": "https://logo.clearbit.com/godaddy.com",
    "name": "iuergfyuq5lwetf4a3wr4q",
    "phone": "8907654321",
    "address": "chennai"
 */
  Company(
      {this.companyAddress,
      this.companyLogo,
      this.companyName,
      this.id,
      this.companyNumber});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['name'];
    companyAddress = json['address'];
    companyNumber = json['phone'];
    companyLogo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['name'] = companyName;
    data['address'] = companyAddress;
    data['phone'] = companyNumber;
    data['logo'] = companyLogo;

    return data;
  }
}
/*
GET retrieves data from a specified resource or endpoint on the server.
POST creates a new resource on the server, sending the data for the new resource in the request body.
PUT updates an entire resource on the server, replacing the existing resource with the new data provided in the request body.
PATCH partially updates an existing resource on the server, modifying only the specific fields or attributes included in the request body.
DELETE removes a resource from the server, permanently deleting the specified resource.

 */
