//
//  SearchViewController.swift
//  Movie Review
//
//  Created by Globeways Technologies on 13/01/23.
//

import UIKit
import Foundation

class SearchViewController: UIViewController , UISearchBarDelegate {
    
    let moviesUrlString = "https://apps.agentur-loop.com/challenge/movies.json"
    var allMoviesTableView: MoviesTableView!
    var allMovies:[MovieData]! = [MovieData]()
    var searchedMovies:[MovieData]! = [MovieData]()
    var isSearch : Bool = false
    var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    
    var searchHeaderView: UIView = {
        let uiview = UIView()
        uiview.translatesAutoresizingMaskIntoConstraints = false
        uiview.layer.shadowOpacity = 0.2
        uiview.layer.shadowOffset = .zero
        uiview.layer.shadowRadius = 30
        uiview.layer.cornerRadius = 12
            return uiview
        }()
    
    var allMoviesHeaderLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.backgroundColor = .clear
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        uilabel.textColor = .black
        uilabel.textAlignment = .center
        uilabel.font = UIFont(name: "SFProText-Bold", size: 24)!
        uilabel.text = "All Movies"
            return uilabel
        }()
    
    
    var backImageView : UIImageView = {
        let boldConfigyse3 = UIImage.SymbolConfiguration(weight: .regular)
        let playButtonImage = UIImage(systemName: "arrow.backward", withConfiguration: boldConfigyse3)
        let playButtonImageView:UIImageView = UIImageView()
        playButtonImageView.image = playButtonImage
        playButtonImageView.tintColor = UIColor.black
        playButtonImageView.backgroundColor = .clear
        playButtonImageView.clipsToBounds = true
        playButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        return playButtonImageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
  
        self.view.backgroundColor = .white
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);

        self.view.addSubview(backImageView)
        backImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 65).isActive = true
        backImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor , constant: 30).isActive = true
        backImageView.widthAnchor.constraint(equalToConstant: 25 ).isActive = true
        backImageView.heightAnchor.constraint(equalToConstant: 25 ).isActive = true

        let closeFavoriteMovieGesture = MyTapGesture(target: self, action: #selector(self.closeFavoriteMovieGestureTap(_:)))
        backImageView.addGestureRecognizer(closeFavoriteMovieGesture)
        backImageView.isUserInteractionEnabled = true

        self.view.addSubview(allMoviesHeaderLabel)
        allMoviesHeaderLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 65).isActive = true
        allMoviesHeaderLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
////        backImageView.widthAnchor.constraint(equalToConstant: 25 ).isActive = true
////        backImageView.heightAnchor.constraint(equalToConstant: 25 ).isActive = true
//
        self.view.addSubview(searchHeaderView)
        searchHeaderView.topAnchor.constraint(equalTo: allMoviesHeaderLabel.bottomAnchor, constant: 30).isActive = true
        searchHeaderView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        searchHeaderView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
        searchHeaderView.heightAnchor.constraint(equalToConstant: 48 ).isActive = true
        searchHeaderView.backgroundColor = .white
        searchHeaderView.layer.cornerRadius = 12
        //searchHeaderView.clipsToBounds = true
        
        searchBar.sizeToFit()
        searchBar.placeholder = "Search Movies"
        searchBar.delegate = self
        searchHeaderView.addSubview(self.searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: searchHeaderView.topAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: searchHeaderView.bottomAnchor).isActive = true
        searchBar.leftAnchor.constraint(equalTo: searchHeaderView.leftAnchor).isActive = true
        searchBar.rightAnchor.constraint(equalTo: searchHeaderView.rightAnchor).isActive = true
        searchBar.searchTextField.backgroundColor = .clear
        searchBar.searchTextField.layer.cornerRadius = 12
        searchBar.layer.cornerRadius = 12
        searchBar.isUserInteractionEnabled = true
        searchBar.layer.borderColor = UIColor.clear.cgColor
        searchBar.backgroundImage = UIImage()

        allMoviesTableView = MoviesTableView()
        allMoviesTableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: "MoviesTableViewCell")
        allMoviesTableView.dataSource = allMoviesTableView as! UITableViewDataSource
        allMoviesTableView.delegate = allMoviesTableView as! UITableViewDelegate
        allMoviesTableView.backgroundColor = .clear
        allMoviesTableView.reloadData()
        allMoviesTableView.translatesAutoresizingMaskIntoConstraints = false
        allMoviesTableView.rowHeight = UITableView.automaticDimension
        allMoviesTableView.layoutMargins = UIEdgeInsets.zero
        allMoviesTableView.separatorInset = UIEdgeInsets.zero
        allMoviesTableView.separatorColor = UIColor.clear
        allMoviesTableView.allowsSelection = false
        self.allMoviesTableView.moviesArrayX = self.allMovies


        self.view.addSubview(allMoviesTableView)
        allMoviesTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        allMoviesTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        allMoviesTableView.topAnchor.constraint(equalTo: searchHeaderView.bottomAnchor, constant: 51).isActive = true
        allMoviesTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        

//        let notificationCenter = NotificationCenter.default
//            notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
//            notificationCenter.addObserver(self, selector: #selector(appCameToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadMoviesJsonData()
        
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            
    }
    
    
    @objc func closeFavoriteMovieGestureTap(_ sender: MyTapGesture? = nil){
        self.dismiss(animated: true)
        
       
        
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
//        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//                let keyboardRectangle = keyboardFrame.cgRectValue
//                let keyboardHeight = keyboardRectangle.height
//            self.view.frame.origin.y = -keyboardHeight
//            }
         // Move view 150 points upward
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0 // Move view to original position
    }
    
    
    func loadMoviesJsonData(){
        
    
        
        Utils.loadJson(fromURLString: moviesUrlString) { (result) in
            switch result {
            case .success(let data):
                    self.allMovies = Utils.parse(jsonData: data)
                    DispatchQueue.main.async {
                        self.allMoviesTableView.moviesArrayX = self.allMovies
                        self.allMoviesTableView.reloadData()
                      //  self.allMoviesTableView.heightAnchor.constraint(equalToConstant: CGFloat (115 * self.staffPicksMovies.count)).isActive = true

                    }
                    
            case .failure(let error):
                print(error)
            }
        }
        
        
        
        
    }
    
    
    func searchBarSearchButtonClicked( _ searchBar: UISearchBar)
    {
       
        
    }
    
    
    //MARK: UISearchbar delegate
       func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
              isSearch = true
       }
          
       func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
              searchBar.resignFirstResponder()
              isSearch = false
           
           DispatchQueue.main.async {
               self.allMoviesTableView.moviesArrayX = self.allMovies
               self.allMoviesTableView.reloadData()

           }
           
       }
          
       func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
              searchBar.resignFirstResponder()
              isSearch = false
           loadMoviesJsonData()
       }
          
       
       func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           if searchText.count == 0 {
               isSearch = false
               DispatchQueue.main.async {
                   self.allMoviesTableView.moviesArrayX = self.allMovies
                   self.allMoviesTableView.reloadData()

               }
           } else {
              
               compareTextAndDisplayNewList(searchText: searchText)
             //  self.maintableView.reloadData()
           }
       }
    
    
    
    
    func compareTextAndDisplayNewList(searchText: String){
        searchedMovies.removeAll()
        for (index, movie) in allMovies.enumerated() {
            
            if (movie.title.contains(searchText) ||
                movie.releaseDate!.contains(searchText) ||
                movie.director.name.contains(searchText) ||
                movie.overview.contains(searchText) ||
                String(movie.reviews).contains(searchText) ||
                String(movie.budget).contains(searchText) ){
                
                self.searchedMovies.append(movie)
            }
           
            
            DispatchQueue.main.async {
                self.allMoviesTableView.moviesArrayX = self.searchedMovies
                self.allMoviesTableView.reloadData()
              //  self.allMoviesTableView.heightAnchor.constraint(equalToConstant: CGFloat (115 * self.staffPicksMovies.count)).isActive = true

            }
            
        }
        
        
    }
    
    
    
   
}
