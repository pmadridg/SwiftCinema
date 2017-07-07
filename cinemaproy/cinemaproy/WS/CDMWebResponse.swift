

import UIKit

class CDMWebResponse: NSObject {
    
    var respuestaJSON   : Any?
    var statusCode      : NSInteger?
    var respuestaNSData : Data?
    var error           : Error?
    var datosCabezera   : NSDictionary?
    var token           : NSString?
    var cookie          : NSString?
    
}
