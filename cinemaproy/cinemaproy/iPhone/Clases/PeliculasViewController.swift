

import UIKit

class PeliculasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tlbPeliculas: UITableView!
    
    
    var arrayPeliculas = NSMutableArray()
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayPeliculas.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PeliculaTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PeliculaTableViewCell
        cell.objPelicula = self.arrayPeliculas[indexPath.row] as! PeliculaBE
        cell.actualizarData()
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "DetallePeliculaViewController", sender: self.arrayPeliculas[indexPath.row])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        PeliculaBC.listarPeliculas { (arrayPeliculas) in
            
            self.arrayPeliculas = arrayPeliculas
            self.tlbPeliculas.reloadData()
        }
        
    }

    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier=="DetallePeliculaViewController" {
            let controller = segue.destination as! DetallePeliculaViewController
            controller.objPelicula=sender as! PeliculaBE
        }
    }
    

}
