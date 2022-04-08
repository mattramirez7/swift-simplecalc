print("Welcome to the UW Calculator Playground")

func calculate(_ args: [String]) -> Int {
    if args.count == 1 {
        return 0
    }
    else {
        let operand = args[1]
        
        switch operand {
        case "+":
            return Int(args[0])! + Int(args[2])!
        case "-":
            return Int(args[0])! - Int(args[2])!
        case "/":
            return Int(args[0])! / Int(args[2])!
        case "%":
            return Int(args[0])! % Int(args[2])!
        case "*":
            return Int(args[0])! * Int(args[2])!
        default:
            let calculation = args[args.count - 1]
            
            switch calculation {
            case "count":
                return args.count - 1
            case "avg":
                var avg = 0
                for index in 0...args.count - 2 {
                    avg += Int(args[index])!
                }
                return avg / (args.count - 1)
            case "fact":
                var fact = Int(args[0])!
                if fact == 0 || fact == 1 {
                    return 1
                }
                for index in 1...(fact - 1) {
                    fact *= (Int(args[0])! - index)
                }
                return fact
            default:
                return 0
            }
        }
    }
}

func calculate(_ arg: String) -> Int {
    var equation = arg
    if equation.hasSuffix("count") {
        return ((equation.count - 5) / 2)
    }
    else if equation.hasSuffix("avg") {
        var avg = 0
        for _ in 1...((arg.count - 3) / 2) {
            let char = equation.removeFirst()
            avg += (char.wholeNumberValue)!
            equation.removeFirst()
        }
        return (avg / ((arg.count - 3) / 2))
    }
    else if equation.hasSuffix("fact") {
        let char = equation.removeFirst()
        var fact = (char.wholeNumberValue)!
        for index in 1...(fact - 1) {
            fact *= ((char.wholeNumberValue)! - index)
        }
        return fact
    }
    else {
        if arg.contains("+") {
            return (arg.first?.wholeNumberValue)! + (arg.last?.wholeNumberValue)!
        }
        else if arg.contains("-") {
            return (arg.first?.wholeNumberValue)! - (arg.last?.wholeNumberValue)!
        }
        else if arg.contains("*") {
            return (arg.first?.wholeNumberValue)! * (arg.last?.wholeNumberValue)!
        }
        else {
            return (arg.first?.wholeNumberValue)! / (arg.last?.wholeNumberValue)!
        }
    }
}

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers
/*
calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5
*/
 
// Implement calculate([String]) and calculate(String)
// to use floating-point values
/*
func calculate(_ args: [String]) -> Double {
    return -1.0
}
func calculate(_ arg: String) -> Double {
    return -1.0
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5
*/
