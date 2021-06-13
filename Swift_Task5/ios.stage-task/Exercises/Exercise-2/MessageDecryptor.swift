import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        
        var breketsCounter = 0
        var submessage = ""
        var result = ""
        var number: Int?
        
        for item in Array(message).enumerated() {
            let el = item.element
            let str = String(el)
            if let int = Int(str) {
                if breketsCounter >= 1 {
                    submessage += str
                    continue
                }
                if number != nil {
                    number = Int("\(number!)\(int)")!
                } else {
                    number = int
                }
                continue
            }
            
            switch el {
            case "[":
                breketsCounter += 1
                if breketsCounter > 1 {
                    submessage += str
                }
            case "]":
                breketsCounter -= 1
                if breketsCounter == 0 {
                    let mes = decryptMessage(submessage)
                    submessage = ""
                    if var snumber = number {
                        if snumber == 0 {
                            continue
                        }
                        while snumber > 0 {
                            snumber -= 1
                            result += mes
                        }
                        number = nil
                    } else {
                        result += mes
                    }
                } else {
                    submessage += "]"
                }
            default:
                if breketsCounter == 0 {
                    result += str
                } else {
                    submessage += str
                }
            }
        }
        
        return result
    }
}
