

import UIKit
import CoreData

class DetallePeliculaViewController: UIViewController {

    @IBOutlet weak var imgPelicula: UIImageView!
    
    @IBOutlet weak var lblnombrePelicula: UILabel!
    @IBOutlet weak var lblhorarioPelicula: UILabel!
    @IBOutlet weak var lblresumenPelicula: UILabel!
    
    
    var objPelicula : PeliculaBE!
    var objHorario : Horario!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CDMImageDownloaded.descargarImagen(enURL: self.objPelicula?.pelicula_urlImagen, paraImageView: self.imgPelicula, conPlaceHolder: nil) { (esCorrecto, nombreImagen, imagen) in
            
            self.imgPelicula.image = imagen
        }
        
       self.lblnombrePelicula.text = self.objPelicula.pelicula_nombre!
        self.lblresumenPelicula.text = self.objPelicula.pelicula_resumen!


        
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "HorarioViewController" {
            
//            let controller = segue.destination as! HorarioViewController
//            controller.objPelicula = self.objPelicula as! PeliculaBE
        }
    }

}
