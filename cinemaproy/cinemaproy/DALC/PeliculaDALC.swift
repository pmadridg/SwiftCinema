

import UIKit
import CoreData

class PeliculaDALC: NSObject {

    
    class func obtener(paraIdPelicula idPelicula : String, enArrayPeliculas arrayPeliculas : NSArray) -> Pelicula?{
        
        if arrayPeliculas.count == 0 {
            return nil
        }
        
        let predicado = NSPredicate(format: "pelicula_id == %@", idPelicula)
        let arrayResultado = arrayPeliculas.filtered(using: predicado)
        
        return arrayResultado.count != 0 ? arrayResultado[0] as? Pelicula : nil
    }

    
    
    
    @discardableResult class func agregar(pelicula objPelicula : PeliculaBE, enArrayPeliculas arrayPeliculas : NSArray,  conContexto contexto : NSManagedObjectContext) -> Pelicula{
        
        var objDM = self.obtener(paraIdPelicula: objPelicula.pelicula_id!, enArrayPeliculas: arrayPeliculas)
        
        if objDM == nil {
            
            objDM = NSEntityDescription.insertNewObject(forEntityName: "Pelicula", into: contexto) as? Pelicula
        }
  
        objDM!.pelicula_id           = objPelicula.pelicula_id!
        objDM!.pelicula_nombre       = objPelicula.pelicula_nombre!
        objDM!.pelicula_resumen      = objPelicula.pelicula_resumen!
        objDM!.pelicula_urlImagen    = objPelicula.pelicula_urlImagen!
        
        return objDM!
    }
    
    
    
    class func listarTodasLasPeliculas(conContexto contexto : NSManagedObjectContext) -> NSArray {
        
        let fetchRequest : NSFetchRequest<Pelicula> = Pelicula.fetchRequest()
        let sortNombre = NSSortDescriptor(key: "pelicula_nombre", ascending: true)
        
        fetchRequest.sortDescriptors = [sortNombre]
        
        do {
            return try contexto.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as NSArray
        }catch{
            return NSArray()
        }
    }
    
}





