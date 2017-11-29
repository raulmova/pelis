//
//  PeliculasAppTableViewController.swift
//  PeliculasApp
//
//  Created by Alumno ITESM Toluca on 01/11/17.
//  Copyright © 2017 Alumno ITESM Toluca. All rights reserved.
//

import UIKit

class PeliculasAppTableViewController: UITableViewController {
    
    var peliculas = [Pelicula]()
    
    private func llenarDatos(){
        
        let imagen1 = UIImage(named: "default")
        let imagen2 = UIImage(named: "starwars")
        
        guard let pelicula1 = Pelicula(nombre: "DBS", compania:"TOEI", foto:imagen1, rating:5) else {
            fatalError("Error al crear el objeto")
        }
        
        guard let pelicula2 = Pelicula(nombre: "Star Wars", compania:"Lucas Films", foto:imagen2, rating:5) else {
            fatalError("Error al crear el objeto")
        }
        
        
        peliculas += [pelicula1, pelicula2]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        llenarDatos()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return peliculas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PeliculasTableViewCell", for: indexPath) as? PeliculasTableViewCell else {
            fatalError("Error al cargar celda como objeto")
        }

        // Configure the cell...
        
        let pelicula = peliculas[indexPath.row]
        
        cell.tfNombre.text = pelicula.nombre
        cell.tfCompania.text = pelicula.compania
        cell.tfRating.text = "\(pelicula.rating) de 5"
        cell.ivFoto.image = pelicula.foto

        return cell
    }
    
    @IBAction func regresarALista(sender: UIStoryboardSegue){
        print("regresarALista")
        
        if let fuente = sender.source as? ViewController, let pelicula = fuente.pelicula {
            if let indexSeleccionado = tableView.indexPathForSelectedRow{
                peliculas[indexSeleccionado.row] = pelicula
                tableView.reloadRows(at: [indexSeleccionado], with: .none)
            } else {
                let index = IndexPath(row: peliculas.count, section: 0)
                peliculas.append(pelicula)
                
                tableView.insertRows(at: [index], with: .fade)
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier ?? "" {
            
            case "identificadorNuevo":
                print("Nuevo Elemento")
            
            case "identificadorDetalle":
                print("Detalle")
                guard let detalleViewController = segue.destination as? ViewController else {
                    fatalError("Error al inicializar view Controller")
                }
            
                guard let celdaSeleccionada = sender as? PeliculasTableViewCell else{
                    fatalError("Error al inicializar el view controller")
                }
            
                guard let indexCelda = tableView.indexPath(for: celdaSeleccionada) else{
                    fatalError("Error al inicializar el view controller")
                }
            
                let peliculaSeleccinada = peliculas[indexCelda.row]
                detalleViewController.pelicula = peliculaSeleccinada
            
            default:
                fatalError()
            }
    }
    

}
