

import UIKit

class HorarioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

//declaracion de la tabla
   
    @IBOutlet weak var tblHorario: UITableView!
    
    var objPelicula : Pelicula!
    
    var arrayHorarios = NSMutableArray()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayHorarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "HorarioTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HorarioTableViewCell
        cell.objHorario = self.arrayHorarios[indexPath.row] as? Horario
        cell.actualizarData()
        
        return cell
        
    }
    
    
    
    
    //Recupera datos de los horarios
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if self.objPelicula?.horarios?.allObjects != nil {
            
            self.arrayHorarios = NSMutableArray(array: (self.objPelicula.horarios?.allObjects)!)
        }
        
        
        self.tblHorario.reloadData()
        super.viewWillAppear(animated)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HorarioBC.listarHorarios{ (arrayHorarios) in
            
            self.arrayHorarios = arrayHorarios
            self.tblHorario.reloadData()
        }
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

}
