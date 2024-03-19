//
//  Data.swift
//  CauseMate
//
//  Created by Ishika Meel on 3/18/24.
//

import Foundation
import CSV

class CSVFileReader {
    
    func readCSV() {
        do {
            
            let stream = InputStream(fileAtPath: "Users/ishika/Documents/CauseMate/CauseMate/eo_nc.csv")!
            let csv = try! CSVReader(stream: stream)
            while let row = csv.next() {
                print("\(row)")
            }
        } catch {
            // Handle any errors that occur
            print("Error reading CSV file: \(error)")
        }
    }
}
