



// Colony size… user types in an Int

// Enter x y coordinates of living cells, blank line when done
// Coor: user types in two Ints, separated by a space
// Coor:

// Running evolution.
// Commands are:
//   Enter an Int: Evolve that number of generation
//   Q: Quit
//   Any other text: Evolve one generation

// Generation #0: 
// Colony prints out

// Command… user types in next command, etc.

func colonyVC(){
print("Colony size", terminator: "... ")
var userId = readLine()!
let x = ""
print("Enter x y coordinates of living cells, blank line when done")
var colony2 = Colony(colonySize: Int(userId)!)
  while userId != x{
    print("Coor:", terminator: " ")
      userId = readLine()!
        var p = arrayOfStringtoInt(splitStringIntoParts(userId))
          if userId != x{
            colony2.setCellAlive(xCoor: p[0], yCoor: p[1])}
      } 
      
    print("Running Evolution.")
    print("Commands are:\nEnter an Int: Evolve that number   of generation\nQ: Quit\nAny other text: Evolve one generation")
        print("Generation #0:")
          print(colony2)
          var colony2Copy = colony2
          let colonyCopy3 = colony2
          var genNum = 0
          print("Command", terminator: "... ")
            userId = readLine()!
while userId != "q"{
  if splitStringIntoParts(userId).count == 2{
    let goback = splitStringIntoParts(userId)[1]
     if Int(goback) != nil{
      let x = Int(goback)
      if x! > genNum{
        print("YOOOOOO what u doing brodie thats to much!!!")
        genNum = 0
      }
      else if x! == genNum{
        genNum -= x!
      }else {
        for _ in 0..<x!{
          colony2Copy.wrappingEvolve()
    genNum -= 1
    }
      }
        colony2 = colony2Copy
        colony2Copy = colonyCopy3
  }
}else if checkIfNumber(userId) == true{
    var x = 0
    for _ in 0..<(Int(userId)!){
    x += 1
    colony2.wrappingEvolve()
  }
  genNum += x
    }else{
    colony2.wrappingEvolve()
    genNum += 1
}
print("Generation #\(genNum):")
print(colony2)

print("Command", terminator: "... ")
  userId = readLine()!
}

}