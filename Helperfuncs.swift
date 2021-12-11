func splitStringIntoParts(_ expression: String)-> [String]  {
    let stringArray = expression.split{$0 == " "}.map{ String($0) } 
      return stringArray
  }

  func arrayOfStringtoInt(_ expression: [String])-> [Int]{
    var intArray: [Int] = []
    for x in expression{
intArray.append(Int(x)!)
    }
    return intArray
  }

  // func arrayIntsToCoors(expression: [Int]){
  //   expression[0]
  // }

  func checkIfNumber(_ string: String)-> Bool{
    let num = Int(string);

    if num != nil {
        return true 
    }
    else {
       return false
    }
  }