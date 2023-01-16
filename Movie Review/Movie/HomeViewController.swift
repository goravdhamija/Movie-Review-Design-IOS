//
//  HomeViewController.swift
//  Movie Review
//
//  Created by Globeways Technologies on 13/01/23.
//

import UIKit
import Foundation



class HomeViewController: UIViewController, MoviesTableViewDelegate {
    
    let moviesUrlString = "https://apps.agentur-loop.com/challenge/movies.json"
    let staffPicksUrlString = "https://apps.agentur-loop.com/challenge/staff_picks.json"
    
    var allMovies:[MovieData]! = [MovieData]()
    var staffPicksMovies:[MovieData]! = [MovieData]()
    
    var myFavoritesCollectionView: MoviesCollectionView!
    var staffPicksMoviesTableView: MoviesTableView!
    
    let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
    
    var scrollViewContainer: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

    var searchView: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = .white
        uiview.translatesAutoresizingMaskIntoConstraints = false
     //   uiview.clipsToBounds = true
        uiview.layer.cornerRadius = 12
//        uiview.layer.borderWidth = 1
//        uiview.layer.borderColor = UIColor.blue.cgColor
        uiview.layer.shadowColor = UIColor.black.cgColor
        uiview.layer.shadowOpacity = 0.16
        uiview.layer.shadowOffset = .zero
        uiview.layer.shadowRadius = 10
            return uiview
        }()
    
    var searchImageView : UIImageView = {
        let boldConfigyse3 = UIImage.SymbolConfiguration(weight: .regular)
        let playButtonImage = UIImage(systemName: "magnifyingglass", withConfiguration: boldConfigyse3)
        let playButtonImageView:UIImageView = UIImageView()
        playButtonImageView.image = playButtonImage
        playButtonImageView.tintColor = UIColor.black
        playButtonImageView.backgroundColor = .clear
        playButtonImageView.clipsToBounds = true
        playButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        return playButtonImageView
    }()
    
    let favouritesHeaderLabel: UILabel = {
        let seekButtonx = UILabel()
        seekButtonx.textColor = .black
        seekButtonx.translatesAutoresizingMaskIntoConstraints = false
            return seekButtonx
        }()
    
    let staffPicksHeaderLabel: UILabel = {
        let seekButtonx = UILabel()
        seekButtonx.textColor = .black
        seekButtonx.translatesAutoresizingMaskIntoConstraints = false
            return seekButtonx
        }()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }

        
        // SFProDisplay-Regular      SFProDisplay-Bold
        // SFProText-Regular      SFProText-Bold
        
        
        
        loadMoviesJsonData()
        
        
        let myAttributeRegular = [ NSAttributedString.Key.font: UIFont(name: "SFProText-Regular", size: 12.0)! ]
        let myAttributeBold = [ NSAttributedString.Key.font: UIFont(name: "SFProText-Bold", size: 12.0)! ]
        let myString1 = NSMutableAttributedString(string: "YOUR", attributes: myAttributeRegular )
        let myString2 = NSMutableAttributedString(string: " FAVORITES", attributes: myAttributeBold )
        myString1.append(myString2)
        
        
        let myString3 = NSMutableAttributedString(string: "OUR", attributes: myAttributeRegular )
        let myString4 = NSMutableAttributedString(string: " STAFF PICKS", attributes: myAttributeBold )
        myString3.append(myString4)
        
        
        
        
        
        self.view.addSubview(scrollView)
       // scrollView.backgroundColor = .blue
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        scrollView.addSubview(scrollViewContainer)
        scrollView.showsVerticalScrollIndicator = false
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        scrollViewContainer.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        scrollViewContainer.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        favouritesHeaderLabel.attributedText = myString1
        
        
        
        scrollViewContainer.addSubview(searchView)
        searchView.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 30).isActive = true
        searchView.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor).isActive = true
        searchView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        searchView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        searchView.addSubview(searchImageView)
        searchImageView.centerXAnchor.constraint(equalTo: searchView.centerXAnchor).isActive = true
        searchImageView.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        searchImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        searchImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let searchMovieGesture = MyTapGesture(target: self, action: #selector(self.searchMovieTap(_:)))
        searchView.addGestureRecognizer(searchMovieGesture)
        searchView.isUserInteractionEnabled = true
        
        
        scrollViewContainer.addSubview(favouritesHeaderLabel)
        favouritesHeaderLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 30).isActive = true
        favouritesHeaderLabel.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 50).isActive = true
        
        
        myFavoritesCollectionView = getFavoritesMoviesCollectionView(frame:CGRect(x: 0, y: 50, width: 1000, height: 270), backgroundColor: UIColor.clear)
        
        scrollViewContainer.addSubview(myFavoritesCollectionView)
        myFavoritesCollectionView.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 0).isActive = true
        myFavoritesCollectionView.topAnchor.constraint(equalTo: favouritesHeaderLabel.bottomAnchor, constant: -40).isActive = true
        myFavoritesCollectionView.heightAnchor.constraint(equalToConstant: 390).isActive = true
        myFavoritesCollectionView.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor).isActive = true
        
        staffPicksHeaderLabel.attributedText = myString3
        scrollViewContainer.addSubview(staffPicksHeaderLabel)
        staffPicksHeaderLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 30).isActive = true
        staffPicksHeaderLabel.topAnchor.constraint(equalTo: myFavoritesCollectionView.bottomAnchor, constant: -20).isActive = true
        
        
        staffPicksMoviesTableView = MoviesTableView()
        staffPicksMoviesTableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: "MoviesTableViewCell")
        staffPicksMoviesTableView.dataSource = staffPicksMoviesTableView as! UITableViewDataSource
        staffPicksMoviesTableView.delegate = staffPicksMoviesTableView as! UITableViewDelegate
        staffPicksMoviesTableView.delegateAction = self
        staffPicksMoviesTableView.backgroundColor = .clear
        staffPicksMoviesTableView.reloadData()
        staffPicksMoviesTableView.translatesAutoresizingMaskIntoConstraints = false
        staffPicksMoviesTableView.rowHeight = UITableView.automaticDimension
        staffPicksMoviesTableView.layoutMargins = UIEdgeInsets.zero
        staffPicksMoviesTableView.separatorInset = UIEdgeInsets.zero
        staffPicksMoviesTableView.separatorColor = UIColor.clear
        staffPicksMoviesTableView.allowsSelection = false
        scrollViewContainer.addSubview(staffPicksMoviesTableView)
        staffPicksMoviesTableView.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 0).isActive = true
        staffPicksMoviesTableView.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor, constant: 0).isActive = true
        staffPicksMoviesTableView.topAnchor.constraint(equalTo: staffPicksHeaderLabel.bottomAnchor, constant: 10).isActive = true
        
        staffPicksMoviesTableView.moviesArrayX = staffPicksMovies
        
        
        scrollViewContainer.bottomAnchor.constraint(equalTo: staffPicksMoviesTableView.bottomAnchor).isActive = true
        
       
        let notificationCenter = NotificationCenter.default
            notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
            notificationCenter.addObserver(self, selector: #selector(appCameToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
       

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadBookmarkMovies()
        staffPicksMoviesTableView.reloadData()
     //   refreshCheckBookMarks()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
        print("Disappear")
      //  Utils.persistBookmarkMovies()
    }
    
    
    
    func getFavoritesMoviesCollectionView(frame myframe:CGRect, backgroundColor mybackgroundColor: UIColor) -> MoviesCollectionView {
        
        
        var myCollectionView:MoviesCollectionView?
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 50, left: 10, bottom: 10, right: 10)
//        layout.itemSize = CGSize(width: 160, height: 160)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 4
        myCollectionView = MoviesCollectionView(frame: myframe, collectionViewLayout: layout)
        myCollectionView?.dataSource = myCollectionView as! UICollectionViewDataSource
        myCollectionView?.delegate = myCollectionView as! UICollectionViewDelegateFlowLayout
        myCollectionView?.register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: "MoviesCollectionViewCell")
        myCollectionView?.backgroundColor = mybackgroundColor
        myCollectionView?.showsVerticalScrollIndicator = false
        myCollectionView?.showsHorizontalScrollIndicator = false
        myCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        return myCollectionView!
         
    }
    
    
    @objc func searchMovieTap(_ sender: MyTapGesture? = nil){
        
        let secondVC = SearchViewController()
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .coverVertical
        secondVC.view.isOpaque = false
        self.present(secondVC, animated: true)
        
    }
    
    
    func loadMoviesJsonData(){
        
        Utils.loadJson(fromURLString: moviesUrlString) { (result) in
            switch result {
            case .success(let data):
                    self.allMovies = Utils.parse(jsonData: data)
            case .failure(let error):
                print(error)
            }
        }
        
        
        Utils.loadJson(fromURLString: staffPicksUrlString) { (result) in
            switch result {
            case .success(let data):
                    self.staffPicksMovies = Utils.parse(jsonData: data)
                    DispatchQueue.main.async {
                        self.staffPicksMoviesTableView.moviesArrayX = self.staffPicksMovies
                        self.staffPicksMoviesTableView.reloadData()
                        self.staffPicksMoviesTableView.heightAnchor.constraint(equalToConstant: CGFloat (115 * self.staffPicksMovies.count)).isActive = true
                        self.initialiseSomeBookmarkMovies()
                        
                    }
                    
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    
    func loadBookmarkMovies(){
        
        var favoriteMovies  = Array(Utils.bookamarkedMoviesDict.values)
        
        DispatchQueue.main.async {
            self.myFavoritesCollectionView.moviesCollection = favoriteMovies
            self.myFavoritesCollectionView.reloadData()
            
        }
        
        
    }
    
    
    func updateMovie(){
        
        loadBookmarkMovies()
        
    }
    
    func initialiseSomeBookmarkMovies(){
        
        if (!Utils.checkIfFileExist(fileName: "bookmarks.txt")){
            
            if (Utils.bookamarkedMoviesDict.count == 0){
                
                for i in 1...3 {
                    Utils.addFavoriteMovie(movieSelected: self.staffPicksMovies[i])
                }
                
                loadBookmarkMovies()
                
                
            }
            Utils.persistBookmarkMovies()
            
        }
        else{
            Utils.readPersistedBookmarkMovies()
            loadBookmarkMovies()
        }
        
    }
    
    
    @objc func appMovedToBackground() {
        print("app enters background")
        Utils.persistBookmarkMovies()
    }

    @objc func appCameToForeground() {
        print("app enters foreground")
    }
   

    

}
