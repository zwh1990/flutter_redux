class FistModuleBean{

  String name;
  String age;
  String sex;

  FistModuleBean.fromJson(Map<String, dynamic> map)
      : name = map['name'],
        age = map['age'],
        sex = map['sex'];

}