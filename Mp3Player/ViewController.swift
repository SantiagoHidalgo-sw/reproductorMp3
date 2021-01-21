//
//  ViewController.swift
//  Mp3Player
//
//  Created by Santiago Hidalgo on 20/01/2021.
//

import UIKit
import AVFoundation
import MediaPlayer


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prevBtn.setImage(prevIcon, for: .normal)
        playBtn.setImage(playIcon, for: .normal)
        postBtn.setImage(postIcon, for: .normal)
        
        
        index = 0
        addSource(numeroCancion: index)
        
        
    }
    
//Outlets
    @IBOutlet weak var prevBtn: UIButton!   
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var postBtn: UIButton!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var autor: UILabel!
    @IBOutlet weak var portada: UIImageView!
    
 //Iconos
    
    let prevIcon = UIImage(systemName: "backward")
    let postIcon = UIImage(systemName: "forward")
    let playIcon = UIImage(systemName: "play")
    let pauseIcon = UIImage(systemName: "pause")
    
    let listaAutor:[String] = ["The Wanted","The Wanted","Sean ft Justin","Justin Bieber"]
    let listaCancion: [String] = ["Warzone","Ligthnig","Eniee Meniee","The Monster"]
    let listaAudio = ["cancion1","cancion2","cancion3","cancion4"]
    let listaPortada: [String] = ["portada1","portada2","portada3","portada4"]
 
    
    //Reproductor
    
    var player = AVAudioPlayer()
    
    //indice de canciones
    
    var index:Int!
    
    
    func addSource(numeroCancion: Int){
        
        let fuenteCancion = NSURL(fileURLWithPath: Bundle.main.path(forResource: listaAudio[numeroCancion], ofType: ".mp3")!)
        let fuentePortada = NSURL(fileURLWithPath: Bundle.main.path(forResource: listaPortada[numeroCancion], ofType: ".jpg")!)
        let coverData = NSData(contentsOf: fuentePortada as URL)
        
        do {
            player = try AVAudioPlayer(contentsOf: fuenteCancion as URL)
            playBtn.setImage(playIcon, for: .normal)
            
            portada.image = UIImage(data: coverData! as Data)
            titulo.text = listaCancion[numeroCancion]
            autor.text = listaAutor[numeroCancion]
            
            
        } catch {
            print("Ups ha ocurrido un error")
            
        }
        
        
    }
    
    //Logica Botones
    
    
    @IBAction func playBtn(_ sender: Any) {
        if !player.isPlaying{
            player.play()
            playBtn.setImage(pauseIcon, for: .normal)
            
        }else{
            
            player.pause()
            playBtn.setImage(playIcon, for: .normal)
            
        }
        
    }
    
    
    @IBAction func postBtn(_ sender: Any) {
        switch index {
        case 0:
            index = 1
        case 1:
            index = 2
        case 2:
            index = 3
        default:
            index = 0
        }
            addSource(numeroCancion: index)
        
        
        
    }
    
    @IBAction func prevBtn(_ sender: Any) {
        switch index {
        case 0:
            index = 3
        case 1:
            index = 0
        case 2:
            index = 1
        default:
            index = 2
        }
            addSource(numeroCancion: index)
        
        
    }
    
    
    
}

