
import UIKit

class CDMWebTranslator: NSObject {

    class func translateSucursalBE(diccionario objDiccionario : NSDictionary) -> SucursalBE{
        
        let objSucursal = SucursalBE()
        
        objSucursal.sucursal_id = objDiccionario["idSucursal"] as? String
        objSucursal.sucursal_nombre = objDiccionario["nombreSucursal"] as? String
        objSucursal.sucursal_direccion = objDiccionario["direccionSucursal"] as? String
        objSucursal.sucursal_urlImagen = objDiccionario["fotoSucursal"] as? String
        
        return objSucursal
    }
    
    
    class func translateHorarioBE(diccionario objDiccionario : NSDictionary) -> HorarioBE{
        
        let objHorario = HorarioBE()
        
        objHorario.horario_idSucursal = objDiccionario["idSucursal"] as? String
        objHorario.horario_idPelicula = objDiccionario["idPelicula"] as? String
        objHorario.horario_horario = objDiccionario["horario"] as? String
        
        return objHorario
    }
    
    
    class func translatePeliculaBE(diccionario objDiccionario : NSDictionary) -> PeliculaBE{
        
        let objPelicula = PeliculaBE()
        
        objPelicula.pelicula_id             = objDiccionario["idPelicula"] as? String
        objPelicula.pelicula_nombre         =  objDiccionario["nombreComercial"] is NSNull ? "-" : objDiccionario["nombreComercial"] as? String
        objPelicula.pelicula_resumen        = objDiccionario["resumen"] as? String
        objPelicula.pelicula_urlImagen      = objDiccionario["aficheOficial"] as? String
        objPelicula.pelicula_reparto        = objDiccionario["reparto"] as? String
        objPelicula.pelicula_director       = objDiccionario["director"] as? String
        objPelicula.pelicula_genero         = objDiccionario["nombreGenero"] as? String
        objPelicula.pelicula_publico         = objDiccionario["tipoPublico"] as? String
        objPelicula.pelicula_fecha         = objDiccionario["fechaPublicacion"] as? String
        
        return objPelicula
    }
    
}
