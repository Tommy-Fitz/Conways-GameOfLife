import Foundation
struct Array2D: CustomStringConvertible{ 
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
     }else{
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
 
func outOfBounds(inputrow: Int, inputCol: Int){
  if inputCol > numberCols - 1{
     print("\(inputCol) is larger then the number of Columns")
     exit(0)
  }
  if inputrow > numberRows - 1{
     print("\(inputrow) is larger then the number of Rows")
     exit(0)
  }
  if inputrow < 0{
print("\(inputrow) is smaller then 0")
     exit(0)
  }
  if inputCol < 0{
    print("\(inputCol) is smaller then 0")
    exit(0)
  }
}
mutating func set(row: Int, col: Int, value: Int){
outOfBounds(inputrow: row, inputCol: col)
let index = (numberCols * row + col)
arrayofInts[index] = value
}
func get(row: Int, col: Int) -> Int{
outOfBounds(inputrow: row, inputCol: col)
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
