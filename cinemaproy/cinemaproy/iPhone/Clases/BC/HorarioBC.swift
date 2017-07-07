

import UIKit

class HorarioBC: NSObject {
    class func listarHorarios(conCompletion completion : @escaping(_ arrayHorarios : NSMutableArray) -> Void) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let arrayHorarios = NSMutableArray(array: HorarioDALC.listarTodasLosHorarios(conContexto: appDelegate.persistentContainer.viewContext))
        completion(arrayHorarios.count == 0 ? NSMutableArray() : arrayHorarios)
    }
    


}
