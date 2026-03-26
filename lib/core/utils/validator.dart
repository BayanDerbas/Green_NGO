abstract class Validator {

  static String? validateEmail(String value) {
    if(value.trim().isEmpty){
      return "الرجاء ادخال الايميل";
    }
    return null;
  }
  
  static String? validatePassword(String value){
    if(value.trim().isEmpty){
      return "الرجاء ادخال كلمة السر";
    }
    return null;
  }
}