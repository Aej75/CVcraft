import 'package:hive/hive.dart';

part 'details.g.dart';

@HiveType(typeId: 1)
class PersonalDetails {

  @HiveField(0)
  String name;

  @HiveField(1)
  String address;
  
  @HiveField(2)
  String age;

  PersonalDetails(this.address, this.age, this.name);

}
