


class StringUtil{

  static bool isNULL(String? value){
    if(value == null){
      return true;
    }
    if(value == ''){
      return true;
    }
    if(value == 'null'){
      return true;
    }
    if(value == 'NULL'){
      return true;
    }
    return false;
  }
}