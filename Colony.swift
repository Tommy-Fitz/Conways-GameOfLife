struct Colony: CustomStringConvertible{
  var colonySize: Int
  var colony: Array2DS
  init(colonySize: Int){
  self.colonySize = colonySize
  colony = Array2DS(numberRows: colonySize, numberCols: colonySize)
}

mutating func setCellAlive(xCoor: Int, yCoor: Int) {
  colony[xCoor,yCoor] = 1
}
mutating func setCellDead(xCoor: Int, yCoor: Int) {
  colony[xCoor,yCoor] = 0
}
mutating func resetColony(){
  var copyarray: [Int] = []
    for _ in colony.arrayofInts{
      copyarray.append(0)
  }
  colony.arrayofInts = copyarray
}
var description: String{
 return colony.description
}
var numberLivingCells: Int{
  var x = 0
  for c in colony.arrayofInts{
     if c > 0 {
     x += 1
    }
  }
    return x
} 



func numberofLivingCells(xCoor: Int, yCoor: Int) -> Int {
let x = colony[xCoor-1,yCoor-1] + colony[xCoor-1,yCoor] + colony[xCoor-1,yCoor+1] + colony[xCoor,yCoor-1] + colony[xCoor+1,yCoor-1] + colony[xCoor+1,yCoor] + colony[xCoor+1,yCoor+1] + colony[xCoor,yCoor+1]
  return x
}
mutating func evolve(){
  var changedColony = colony
  for r in 0..<colonySize{
    for c in 0..<colonySize{
      if numberofLivingCells(xCoor: r, yCoor: c) == 3{
    changedColony[r,c] = 1
      }else if numberofLivingCells(xCoor: r, yCoor: c) < 2{
    changedColony[r,c] = 0
      }else if numberofLivingCells(xCoor: r, yCoor: c) > 3{
    changedColony[r,c] = 0
      }
    }
  }
  colony = changedColony
  }









    func sideWrapping(xCoor: Int, yCoor: Int)-> Int{
    var x = 0
if colony.outOfBounds(inputrow: xCoor, inputCol: yCoor-1) == true{
x = colony[xCoor-1,yCoor-1] + colony[xCoor-1,yCoor] + colony[xCoor-1,yCoor+1] + colony[xCoor,yCoor-1] + colony[xCoor+1,yCoor-1] + colony[xCoor+1,yCoor] + colony[xCoor+1,yCoor+1] + colony[xCoor,yCoor+1]
x += colony[xCoor, yCoor + (colonySize-1)] + colony[xCoor - 1, yCoor + (colonySize-1)] + colony[xCoor + 1, yCoor + (colonySize-1)]
    } else if colony.outOfBounds(inputrow: xCoor, inputCol: yCoor+1) == true {
x = colony[xCoor-1,yCoor-1] + colony[xCoor-1,yCoor] + colony[xCoor-1,yCoor+1] + colony[xCoor,yCoor-1] + colony[xCoor+1,yCoor-1] + colony[xCoor+1,yCoor] + colony[xCoor+1,yCoor+1] + colony[xCoor,yCoor+1]
let firstYcoor = yCoor - (colonySize-1)
x += colony[xCoor, firstYcoor] + colony[xCoor - 1, firstYcoor] + colony[xCoor + 1, firstYcoor]
    }else if colony.outOfBounds(inputrow: xCoor+1, inputCol: yCoor) == true{
x = colony[xCoor-1,yCoor-1] + colony[xCoor-1,yCoor] + colony[xCoor-1,yCoor+1] + colony[xCoor,yCoor-1] + colony[xCoor+1,yCoor-1] + colony[xCoor+1,yCoor] + colony[xCoor+1,yCoor+1] + colony[xCoor,yCoor+1]
x += colony[xCoor - (colonySize-1), yCoor+1] + colony[xCoor - (colonySize-1), yCoor] + colony[xCoor - (colonySize-1), yCoor-1]
    } else if colony.outOfBounds(inputrow: xCoor-1, inputCol: yCoor) == true{
x = colony[xCoor-1,yCoor-1] + colony[xCoor-1,yCoor] + colony[xCoor-1,yCoor+1] + colony[xCoor,yCoor-1] + colony[xCoor+1,yCoor-1] + colony[xCoor+1,yCoor] + colony[xCoor+1,yCoor+1] + colony[xCoor,yCoor+1]
x += colony[xCoor + (colonySize-1), yCoor+1] + colony[xCoor + (colonySize-1), yCoor] + colony[xCoor + (colonySize-1), yCoor-1]
    } else {
    x = colony[xCoor-1,yCoor-1] + colony[xCoor-1,yCoor] + colony[xCoor-1,yCoor+1] + colony[xCoor,yCoor-1] + colony[xCoor+1,yCoor-1] + colony[xCoor+1,yCoor] + colony[xCoor+1,yCoor+1] + colony[xCoor,yCoor+1]
    }
   return x
} 
  
mutating func wrappingEvolve(){
  var x = 0
  var changedColony = colony

for r in 0..<colonySize{
 for c in 0..<colonySize{
   let xCoor = r
   let yCoor = c
   
   if r == 0 && c == 0{
x = colony[xCoor-1,yCoor-1] + colony[xCoor-1,yCoor] + colony[xCoor-1,yCoor+1] + colony[xCoor,yCoor-1] + colony[xCoor+1,yCoor-1] + colony[xCoor+1,yCoor] + colony[xCoor+1,yCoor+1] + colony[xCoor,yCoor+1]
x += colony[xCoor + (colonySize-1), yCoor+1] + colony[xCoor + (colonySize-1), yCoor] + colony[xCoor + 1,  yCoor + (colonySize-1)] + colony[xCoor, yCoor + (colonySize-1)] + colony[xCoor + (colonySize-1), yCoor + (colonySize-1)]
      if x == 3{
    changedColony[r,c] = 1
      }else if x < 2{
    changedColony[r,c] = 0
      }else if x > 3{
    changedColony[r,c] = 0
      }

   }else if r == colonySize-1 && c == 0{
     x = colony[xCoor-1,yCoor-1] + colony[xCoor-1,yCoor] + colony[xCoor-1,yCoor+1] + colony[xCoor,yCoor-1] + colony[xCoor+1,yCoor-1] + colony[xCoor+1,yCoor] + colony[xCoor+1,yCoor+1] + colony[xCoor,yCoor+1]
x += colony[xCoor - (colonySize-1), yCoor+1] + colony[xCoor - (colonySize-1), yCoor] + colony[xCoor - 1,  yCoor + (colonySize-1)] + colony[xCoor, yCoor + (colonySize-1)] + colony[xCoor - (colonySize-1), yCoor + (colonySize-1)]
      if x == 3{
    changedColony[r,c] = 1
      }else if x < 2{
    changedColony[r,c] = 0
      }else if x > 3{
    changedColony[r,c] = 0
      }
   }else if r == colonySize-1 && c == colonySize-1 {
        x = colony[xCoor-1,yCoor-1] + colony[xCoor-1,yCoor] + colony[xCoor-1,yCoor+1] + colony[xCoor,yCoor-1] + colony[xCoor+1,yCoor-1] + colony[xCoor+1,yCoor] + colony[xCoor+1,yCoor+1] + colony[xCoor,yCoor+1]
x += colony[xCoor - (colonySize-1), yCoor-1] + colony[xCoor - (colonySize-1), yCoor] + colony[xCoor - 1,  yCoor - (colonySize-1)] + colony[xCoor, yCoor - (colonySize-1)] + colony[xCoor - (colonySize-1), yCoor - (colonySize-1)]
      if x == 3{
    changedColony[r,c] = 1
      }else if x < 2{
    changedColony[r,c] = 0
      }else if x > 3{
    changedColony[r,c] = 0
      }
   }else if r == 0 && c == colonySize-1{
     x = colony[xCoor-1,yCoor-1] + colony[xCoor-1,yCoor] + colony[xCoor-1,yCoor+1] + colony[xCoor,yCoor-1] + colony[xCoor+1,yCoor-1] + colony[xCoor+1,yCoor] + colony[xCoor+1,yCoor+1] + colony[xCoor,yCoor+1]
x += colony[xCoor, yCoor - (colonySize-1)] + colony[xCoor + 1, yCoor - (colonySize - 1)] + colony[xCoor + (colonySize - 1),  yCoor] + colony[xCoor + (colonySize-1), yCoor - 1] + colony[xCoor + (colonySize-1), yCoor - (colonySize-1)]
      if x == 3{
    changedColony[r,c] = 1
      }else if x < 2{
    changedColony[r,c] = 0
      }else if x > 3{
    changedColony[r,c] = 0
      } 
   }else if sideWrapping(xCoor: r, yCoor: c) == 3{
    changedColony[r,c] = 1
      }else if sideWrapping(xCoor: r, yCoor: c) < 2{
    changedColony[r,c] = 0
      }else if sideWrapping(xCoor: r, yCoor: c) > 3{
    changedColony[r,c] = 0
      }
   }
      
 
  }
  colony = changedColony
}

} 
