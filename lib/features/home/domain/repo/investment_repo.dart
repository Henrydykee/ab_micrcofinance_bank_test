
import '../../data/model/investment_model.dart';

class InvestmentRepository {
  Future<List<InvestmentModel>> getInvestments() async {

    List<dynamic> jsonData = [
      {
        "name": "Propertyvest Estate",
        "pricePerUnit": 250000,
        "status": "still selling",
        "image": "assets/images/propety_estate.png",
        "yield": "10%",
        "type": "Real Estate"
      },
      {
        "name": "Cashew Nuts",
        "pricePerUnit": 1500,
        "status": "soldout",
        "image": "assets/images/agri_tech.png",
        "yield": "30%",
        "type": "Agriculture"
      },
      {
        "name": "Propertyvest Estate",
        "pricePerUnit": 300000,
        "status": "still selling",
        "image": "assets/images/propety_estate.png",
        "yield": "10%",
        "type": "Real Estate"
      },
      {
        "name": "Cashew Nuts",
        "pricePerUnit": 1200,
        "status": "still selling",
        "image": "assets/images/thrive_agric.png",
        "yield": "30%",
        "type": "Agriculture"
      },
      {
        "name": "Propertyvest Estate",
        "pricePerUnit": 270000,
        "status": "soldout",
        "image": "assets/images/propety_estate.png",
        "yield": "10%",
        "type": "Real Estate"
      },
      {
        "name": "Cashew Nuts",
        "pricePerUnit": 1800,
        "status": "still selling",
        "image": "assets/images/thrive_agric.png",
        "yield": "30%",
        "type": "Agriculture"
      }
    ];

    return jsonData
        .map((json) => InvestmentModel.fromJson(json))
        .toList();
  }
}