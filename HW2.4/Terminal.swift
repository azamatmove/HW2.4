//
//  Terminal.swift
//  HW2.4
//
//  Created by Azamat Sarinzhiev on 26/10/21.
//

import Foundation
class Terminal {
    private var notes : [Int] = [0, 0, 0, 0, 0, 0, 0, 0]
    private var banknotes : [Int] = [5000, 2000, 1000, 500, 200, 100, 50, 20]
    var clientNotes: [Int] = [0, 0, 0, 0, 0, 0, 0, 0]
    init(fiveThousand:Int, twoThousand:Int, thousand:Int, fiveHundred:Int, twoHundred:Int, hundred:Int, fifty: Int, twenty:Int) {
        self.notes[0] = fiveThousand
        self.notes[1] = twoThousand
        self.notes[2] = thousand
        self.notes[3] = fiveHundred
        self.notes[4] = twoHundred
        self.notes[5] = hundred
        self.notes[6] = fifty
        self.notes[7] = twenty
}
    func InsertNotes() -> [Int] {
        var amountOfMoney : Int = 0
        var notesToAdd: Int = 0
        print("Type the amount of money you would like to top up.")
        amountOfMoney = Int (readLine()!)!
        for n in 0...banknotes.count-1{
            if(banknotes[n] > amountOfMoney){
                continue
            }
            else if notes[n] <= 0 {
                continue
            }
            else {
                notesToAdd = amountOfMoney / banknotes[n]
                amountOfMoney -= banknotes[n] * notesToAdd
                notes[n] += notesToAdd
                clientNotes[n] += notesToAdd
            }
        }
        return clientNotes
    }
    func ReceiveNotes() -> [Int]? {
        var amountOfMoney : Int = 0
        var notesToDeduct: Int = 0
        print("Type the amount of money you would like to receive.")
        amountOfMoney = Int (readLine()!)!
        if CountSum() > amountOfMoney {
        for n in 0...banknotes.count-1{
            if(banknotes[n] > amountOfMoney){
                continue
            }
            else if notes[n] <= 0 {
                continue
            }else {
                    notesToDeduct = amountOfMoney / banknotes[n]
                    if notes[n] < notesToDeduct{
                        amountOfMoney -= banknotes[n] * notes[n]
                        clientNotes[n] += notes[n]
                        notes[n] = 0
                    }else{
                        amountOfMoney -= banknotes[n] * notesToDeduct
                        notes[n] -= notesToDeduct
                        clientNotes[n] += notesToDeduct
                    }
            }
            return clientNotes
        }
        } else {
            print("Not enough money")
        }
        return nil  // clientNotes
    }
    func CountSum() -> Int {
        var sum : Int = 0
        for n in 0...banknotes.count-1 {
            sum += notes[n] * banknotes[n]
        }
        return sum
    }
}
