
import UIKit

class SucursalBC: NSObject {
    
    class func listarSucursales(conCompletion completion : @escaping(_ arraySucursales : NSMutableArray) -> Void) {
        
        CDMWebModel.obtenerInformacion { (arrayPeliculas, arraySucursales, arrayHorarios) in
            
            completion(arraySucursales as! NSMutableArray)
            
        }
    }


}
