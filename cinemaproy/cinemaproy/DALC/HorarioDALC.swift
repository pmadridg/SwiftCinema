
import UIKit
import CoreData


class HorarioDALC: NSObject {

    class func obtener(paraIdPelicula idPelicula : String, paraIdSucursal idSucursal : String, enArrayHorarios arrayHorarios : NSArray) -> Horario?{
        
        if arrayHorarios.count == 0 {
            return nil
        }
        
        let predicado = NSPredicate(format: "pelicula.pelicula_id == %@ && sucursal.sucursal_id == %@", idPelicula, idSucursal)
        let arrayResultado = arrayHorarios.filtered(using: predicado)
        
        return arrayResultado.count != 0 ? arrayResultado[0] as? Horario : nil
    }
    
    
    
    
    @discardableResult class func agregar(horario objHorario : HorarioBE, conArrayPeliculas arrayPeliculas : NSArray, conArraySucursales arraySucursales : NSArray, enArrayHorario arrayHorario : NSArray, conContexto contexto : NSManagedObjectContext) -> Horario{
        
        var objDM = self.obtener(paraIdPelicula: objHorario.horario_idPelicula!, paraIdSucursal: objHorario.horario_idSucursal!, enArrayHorarios: arrayHorario)
        
        
        if objDM == nil {
            
            objDM = NSEntityDescription.insertNewObject(forEntityName: "Horario", into: contexto) as? Horario
        }
        
        objDM?.horario_horario = objHorario.horario_horario!
        
        let objPelicula = PeliculaDALC.obtener(paraIdPelicula: objHorario.horario_idPelicula!, enArrayPeliculas: arrayPeliculas)
        let objSucursal = SucursalDALC.obtener(porIdSucursal: objHorario.horario_idSucursal!, enArraySucursales: arraySucursales)
        
        objPelicula?.addToHorarios(objDM!)
        objSucursal?.addToHorarios(objDM!)
        
        return objDM!
    }
    
    
    
    class func listarTodasLosHorarios(conContexto contexto : NSManagedObjectContext) -> NSArray {
        
        let fetchRequest : NSFetchRequest<Horario> = Horario.fetchRequest()
        
        do {
            return try contexto.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as NSArray
        }catch{
            return NSArray()
        }
    }
    
}
