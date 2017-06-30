
import UIKit


class CDMWebModel: NSObject {

    static let CDMWebModelURLBase : NSString = "http://coredatamedia.com"
    
    typealias ArrayInformacion = (_ arrayPeliculas : NSArray, _ arraySucursales : NSArray, _ arraHorarios : NSArray) -> Void
    
    class func leerHorarios(deArrayHorarios arrayHorarios : NSArray) -> NSArray{
        
        let arrayFinalHorarios = NSMutableArray()
        
        arrayHorarios.enumerateObjects({ (obj, idx, stop) in
            
            arrayFinalHorarios.add(CDMWebTranslator.translateHorarioBE(diccionario: obj as! NSDictionary))
        })
        
        return arrayFinalHorarios
    }
    
    
    class func leerSucusales(deArraySucusales arraySucusales : NSArray) -> NSArray{
        
        let arrayFinalSucusales = NSMutableArray()
        
        arraySucusales.enumerateObjects({ (obj, idx, stop) in
            
            arrayFinalSucusales.add(CDMWebTranslator.translateSucursalBE(diccionario: obj as! NSDictionary))
        })
        
        return arrayFinalSucusales
    }
    
    
    
    class func leerPeliculas(deArrayPeliculas arrayPeliculas : NSArray) -> NSArray{
        
        let arrayFinalPeliculas = NSMutableArray()
        
        arrayPeliculas.enumerateObjects({ (obj, idx, stop) in
            
            arrayFinalPeliculas.add(CDMWebTranslator.translatePeliculaBE(diccionario: obj as! NSDictionary))
        })
        
        return arrayFinalPeliculas
    }
    
    
    class func obtenerInformacion(conCompletion completion : @escaping ArrayInformacion) {
        
        CDMWebSender.doGETToURL(conURL: self.CDMWebModelURLBase, conPath: "peliculas.json", conParametros: nil) { (objRespuesta) in
            
            let respuestaDiccionario = objRespuesta.respuestaJSON as! NSDictionary
            let arrayPeliculasRespuesta = respuestaDiccionario["peliculas"] as! NSArray
            let arraySucursalRespuesta = respuestaDiccionario["sucursales"] as! NSArray
            let arrayHorariosRespuesta = respuestaDiccionario["cartelera"] as! NSArray
            
            let arrayPeliculasRespuestaBE = self.leerPeliculas(deArrayPeliculas: arrayPeliculasRespuesta)
            let arraySucusalesRespuestaBE = self.leerSucusales(deArraySucusales: arraySucursalRespuesta)
            let arrayHorariosRespuestaBE = self.leerHorarios(deArrayHorarios: arrayHorariosRespuesta)
            
            completion(arrayPeliculasRespuestaBE, arraySucusalesRespuestaBE, arrayHorariosRespuestaBE)
        }
    }
    
}
