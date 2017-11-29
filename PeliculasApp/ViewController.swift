//
//  ViewController.swift
//  PeliculasApp
//
//  Created by Alumno ITESM Toluca on 01/11/17.
//  Copyright © 2017 Alumno ITESM Toluca. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfCompania: UITextField!
    @IBOutlet weak var sRating: UISlider!
    @IBOutlet weak var ivFoto: UIImageView!
    @IBOutlet weak var bGuardar: UIBarButtonItem!
    @IBOutlet weak var niTitulo: UINavigationItem!
    
    var pelicula: Pelicula?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tfNombre.delegate = self
        tfCompania.delegate = self
        
        if let pelicula = pelicula{
            niTitulo.title = pelicula.nombre
            tfNombre.text = pelicula.nombre
            tfCompania.text = pelicula.compania
            ivFoto.image = pelicula.foto
            sRating.value = Float(pelicula.rating)
        }
        
        habilitarBotonGuardar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func habilitarBotonGuardar(){
        let nombre = tfNombre.text!
        let compania = tfCompania.text!
        
        guard !nombre.isEmpty && !compania.isEmpty else {
            bGuardar.isEnabled = false
            return
        }
        
        bGuardar.isEnabled = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let nombreVacio = tfNombre.text!.isEmpty
        
        if nombreVacio {
            niTitulo.title = "Nueva Película"
        } else {
            niTitulo.title = tfNombre.text
        }
        
        habilitarBotonGuardar()
    }

    @IBAction func seleccionarDeGaleria(_ sender: Any) {
        tfNombre.resignFirstResponder()
        tfCompania.resignFirstResponder()
        
        let galeria = UIImagePickerController()
        
        galeria.sourceType = .photoLibrary
        galeria.delegate = self
        
        present(galeria, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let imagenSeleccionada = info [UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("No se pudo seleccionar la foto")
        }
        
        ivFoto.image = imagenSeleccionada
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        tfNombre.resignFirstResponder()
        tfCompania.resignFirstResponder()
        
        habilitarBotonGuardar()
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let guardar = sender as? UIBarButtonItem, guardar === bGuardar else{
            return
        }
        
        let nombre = tfNombre.text ?? ""
        let compania = tfCompania.text ?? ""
        let rating = sRating.value
        
        pelicula = Pelicula(nombre: nombre, compania: compania, foto: ivFoto.image, rating: Int(rating))
    }
    
    @IBAction func cancelarNuevaPelicula(_ sender:Any){
        let isModonuevo = presentingViewController is UINavigationController
        
        if isModonuevo {
            dismiss(animated: true, completion: nil)
            
        } else if let navegacion = navigationController {
            navegacion.popViewController(animated: true)
        }
    }

}

