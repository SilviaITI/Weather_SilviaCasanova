//
//  String+Extension.swift
//  RickMortyApp
//
//  Created by Silvia Casanova Martinez on 21/8/24.
//

import Foundation

extension String {
    
    // Se utiliza para el control de copies
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
   static func dateFormat(originalDateString: String) -> String? {
        let dateFormatter = DateFormatter()
        
          dateFormatter.dateFormat = "yyyy-MM-dd"
          
          guard let date = dateFormatter.date(from: originalDateString) else {
              print("Error: No se pudo convertir la fecha.")
              return nil
          }
          dateFormatter.dateFormat = "dd-MM-yyyy"
       
          return dateFormatter.string(from: date)
    }
}
