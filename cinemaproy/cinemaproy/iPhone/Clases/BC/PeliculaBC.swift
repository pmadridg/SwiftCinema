

import UIKit

class PeliculaBC: NSObject {

    class func listarPeliculas(conCompletion completion : @escaping(_ arrayPeliculas : NSMutableArray) -> Void) {
        
        CDMWebModel.obtenerInformacion { (arrayPeliculas, arraySucursales, arrayHorarios) in
            
            completion(arrayPeliculas as! NSMutableArray)
            
        }
    }
    
}
