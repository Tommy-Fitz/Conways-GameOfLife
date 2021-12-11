import Foundation
struct Array2DS: CustomStringConvertible{ 
  var numberRows: Int
  var numberCols: Int
  var arrayofInts: [Int] = []
  var description: String{
  var emptystring = ""
   for a in 0..<arrayofInts.count{
     if a % numberCols == 0{
     emptystring += "\n"
     }
      if arrayofInts[a] == 0{
       emptystring += (". ")
      } else{
         emptystring += ("* ")
     }
   }
  return emptystring
 }
 init(numberRows: Int, numberCols: Int){
   self.numberCols = numberCols
    self.numberRows = numberRows
     var x = 0
      while numberCols * numberRows != x{
     arrayofInts.append(0)
       x += 1
    }
 }
 
func outOfBounds(inputrow: Int, inputCol: Int)-> Bool{
  var tf = false
    if inputCol > numberCols - 1{
     tf = true
  }
  if inputrow > numberRows - 1{
     tf = true
  }
  if inputrow < 0{
   tf = true
  }
  if inputCol < 0{
     tf = true
  }
  return tf
}
mutating func set(row: Int, col: Int, value: Int){
  if outOfBounds(inputrow: row, inputCol: col) == true{
    return
}
let index = (numberCols * row + col)
  arrayofInts[index] = value
}
func get(row: Int, col: Int) -> Int{
  if outOfBounds(inputrow: row, inputCol: col) == true{
    return 0
}
let yop = (numberCols * row + col)
  return arrayofInts[yop]
}

subscript(row: Int, col: Int) -> Int{
	get{
	return get(row: row, col: col)
	} set(newValue){
    return set(row: row, col: col, value: newValue)
	}
}

func index(row: Int, col: Int) -> Int{
 return (numberCols * row + col)
}

}
