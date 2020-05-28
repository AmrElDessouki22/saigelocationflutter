 
 import 'dart:convert';

import 'package:http/http.dart' as http;

import 'envSai.dart';
 Future getnearest(userlocation,arrlocations) async
  {
    
  userlocation = {	"lon": 32.269864,"lat": 30.600454};
  
  var url = 'https://sai-geolocation.herokuapp.com/nearest/'+envSai;
  
  arrlocations = 
    	[
			
			{
			"uid":"21313edwsdewfd:Sai",
			"location":
			{
			"lon":77.848971,
			"lat":24.233607
			}
			
			},
			{
			"uid":"21313edwsdewfd:nearestone",
			"location":
			{
			"lon":32.315597,
			"lat":30.858078
			}
			
				
			},
			{
			"uid":"21313edwsdewfd:nearestone2",
			"location":
			{
				"lon":32.290622,
				"lat":30.675865	
			
			}
			},
			{
			"uid":"21313edwsdewfd:mohamed",
			"location":
			{
			"lon":32.270822,
			"lat":130.619300
			}
			}
			
	];
  var json_converter = {'userlocation':userlocation,'arrlocations':arrlocations};
  print(json.encode(json_converter));
  var headers = {'Content-Type':'application/json'};
  var response = await http.post(url,body:json.encode(json_converter),headers: headers);
  print(response.body);
  var response_dart = json.decode(response.body);
  return response_dart;
  }