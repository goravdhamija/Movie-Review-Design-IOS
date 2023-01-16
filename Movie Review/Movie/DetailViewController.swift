//
//  DetailViewController.swift
//  Movie Review
//
//  Created by Globeways Technologies on 13/01/23.
//

import UIKit
import Foundation

class DetailViewController: UIViewController {
    
    var movieData:MovieData!
    var keyfactsData:[KeyfactsData]! = [KeyfactsData]()
    
    
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
    
    var movieImageView1: UIImageView = {
        let uiview = UIImageView()
        uiview.translatesAutoresizingMaskIntoConstraints = false
            return uiview
        }()
    
    var moviePosterShadowView: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = .clear
        uiview.translatesAutoresizingMaskIntoConstraints = false
            return uiview
        }()
    
    var ratingView : RatingStarView = {
        
        let playButtonImageView:RatingStarView = RatingStarView(sizex: 18, gapx: 2)
        playButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        return playButtonImageView
    }()
    
    var releaseDateLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.backgroundColor = .clear
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        uilabel.textColor = .darkGray
        uilabel.textAlignment = .center
        uilabel.font = UIFont(name: "SFProText-Regular", size: 14.0)!
            return uilabel
        }()
    
    var durationLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.backgroundColor = .clear
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        uilabel.textColor = .darkGray
        uilabel.textAlignment = .left
        uilabel.font = UIFont(name: "SFProText-Regular", size: 12.0)!
            return uilabel
        }()
    
    var titleLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.backgroundColor = .clear
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        uilabel.textColor = .black
        uilabel.textAlignment = .center
        
        uilabel.numberOfLines = 0
        uilabel.lineBreakMode = .byWordWrapping
        uilabel.sizeToFit()
        uilabel.clipsToBounds = true
        
        uilabel.font = UIFont(name: "SFProText-Regular", size: 12.0)!
            return uilabel
        }()
    
    var releaseYearLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.backgroundColor = .clear
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        uilabel.textColor = .darkGray
        uilabel.textAlignment = .left
        uilabel.font = UIFont(name: "SFProText-Regular", size: 12.0)!
            return uilabel
        }()
    
    var overviewHeaderLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.backgroundColor = .clear
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        uilabel.textColor = .darkGray
        uilabel.textAlignment = .left
        uilabel.font = UIFont(name: "SFProText-Bold", size: 16.0)!
            return uilabel
        }()
    
    var overviewLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.backgroundColor = .clear
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        uilabel.textColor = .gray
        uilabel.textAlignment = .left
        
        uilabel.numberOfLines = 0
        uilabel.lineBreakMode = .byWordWrapping
        uilabel.sizeToFit()
        uilabel.clipsToBounds = true
        
        uilabel.font = UIFont(name: "SFProText-Regular", size: 16.0)!
            return uilabel
        }()
    
    
    var keyfactsHeaderLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.backgroundColor = .clear
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        uilabel.textColor = .darkGray
        uilabel.textAlignment = .left
        uilabel.font = UIFont(name: "SFProText-Bold", size: 16.0)!
            return uilabel
        }()
    var generesCollectionView:GeneresCollectionView!
    var myCollectionView:KefactsCollectionView!
    
    var headerNavigatorContainer: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    var closePageView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 15
            return view
        }()
    
    var closeImageView : UIImageView = {
        let boldConfigyse3 = UIImage.SymbolConfiguration(weight: .regular)
        let playButtonImage = UIImage(systemName: "xmark", withConfiguration: boldConfigyse3)
        let playButtonImageView:UIImageView = UIImageView()
        playButtonImageView.image = playButtonImage
        playButtonImageView.tintColor = UIColor.black
        playButtonImageView.backgroundColor = .clear
        playButtonImageView.clipsToBounds = true
        playButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        return playButtonImageView
    }()
    
    var bookmarkUnfill : UIImageView = {
        let boldConfigyse3 = UIImage.SymbolConfiguration(weight: .regular)
        let playButtonImage = UIImage(systemName: "bookmark", withConfiguration: boldConfigyse3)
        let playButtonImageView:UIImageView = UIImageView()
        playButtonImageView.image = playButtonImage
        playButtonImageView.tintColor = UIColor.black
        playButtonImageView.backgroundColor = .clear
        playButtonImageView.clipsToBounds = true
        playButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        return playButtonImageView
    }()
    
    
    var bookmarkFilled : UIImageView = {
        let boldConfigyse3 = UIImage.SymbolConfiguration(weight: .regular)
        let playButtonImage = UIImage(systemName: "bookmark.fill", withConfiguration: boldConfigyse3)
        let playButtonImageView:UIImageView = UIImageView()
        playButtonImageView.image = playButtonImage
        playButtonImageView.tintColor = UIColor.orange
        playButtonImageView.backgroundColor = .clear
        playButtonImageView.clipsToBounds = true
        playButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        return playButtonImageView
    }()

    init(movieData: MovieData) {
            self.movieData = movieData
            var keyfact1 = KeyfactsData(title: "Budget",value: "$ \(movieData.budget)")
            var keyfact2 = KeyfactsData(title: "Revenue",value: "$ \(movieData.revenue!)")
        
            let locale = NSLocale.autoupdatingCurrent
            let code = movieData.language!
            let language = locale.localizedString(forLanguageCode: code)!
        
            var keyfact3 = KeyfactsData(title: "Original Language",value: "\(language)")
        
            var rating = String(format: "%.2f", movieData.rating!)
            var reviews = movieData.reviews
            var keyfact4 = KeyfactsData(title: "Rating",value: "\(rating) (\(reviews))")
         
            self.keyfactsData.append(keyfact1)
            self.keyfactsData.append(keyfact2)
            self.keyfactsData.append(keyfact3)
            self.keyfactsData.append(keyfact4)
        
            super.init(nibName: nil, bundle: nil)

        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
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
        
      
        
        scrollViewContainer.addSubview(moviePosterShadowView)
        moviePosterShadowView.backgroundColor = .purple
        moviePosterShadowView.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor).isActive = true
        moviePosterShadowView.heightAnchor.constraint(equalToConstant: 295.52).isActive = true
        moviePosterShadowView.widthAnchor.constraint(equalToConstant: 203).isActive = true
        moviePosterShadowView.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor, constant: 104).isActive = true
        moviePosterShadowView.layer.shadowColor = UIColor.black.cgColor
        moviePosterShadowView.layer.shadowOpacity = 0.6
        moviePosterShadowView.layer.shadowOffset = .zero
        moviePosterShadowView.layer.shadowRadius = 30
        moviePosterShadowView.layer.cornerRadius = 14
        
        moviePosterShadowView.addSubview(movieImageView1)
        movieImageView1.leftAnchor.constraint(equalTo: moviePosterShadowView.leftAnchor).isActive = true
        movieImageView1.rightAnchor.constraint(equalTo: moviePosterShadowView.rightAnchor).isActive = true
        movieImageView1.topAnchor.constraint(equalTo: moviePosterShadowView.topAnchor).isActive = true
        movieImageView1.bottomAnchor.constraint(equalTo: moviePosterShadowView.bottomAnchor).isActive = true
        movieImageView1.backgroundColor = .green
        movieImageView1.layer.cornerRadius = 14
        movieImageView1.layer.masksToBounds = true
        movieImageView1.clipsToBounds = true
        
        Utils.insertDisplayableImageInImageView(remoteURLString: movieData.posterUrl!, toFolder: "movies", atImageView: movieImageView1, defaultIOSImage: "popcorn.fill")
        
        
        scrollViewContainer.addSubview(ratingView)
        ratingView.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor).isActive = true
        ratingView.topAnchor.constraint(equalTo: moviePosterShadowView.bottomAnchor, constant: 18).isActive = true
        ratingView.heightAnchor.constraint(equalToConstant: 17).isActive = true
        ratingView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        ratingView.setRating(ratingUnit: Int(round(movieData.rating)))
        
        
        scrollViewContainer.addSubview(releaseDateLabel)
        releaseDateLabel.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor).isActive = true
        releaseDateLabel.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 12).isActive = true
        releaseDateLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true

        releaseDateLabel.text = "\(Utils.convertDateFormatAString(stringDate: movieData.releaseDate!)) - \(Double(movieData.runtime! * 60).asDurationString(style: .abbreviated))"
        
        scrollViewContainer.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 10).isActive = true
        titleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 270).isActive = true
        titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
        let myAttributeRegular = [ NSAttributedString.Key.font: UIFont(name: "SFProText-Regular", size: 24.0)! , NSAttributedString.Key.foregroundColor: UIColor.gray ]
        let myAttributeBold = [ NSAttributedString.Key.font: UIFont(name: "SFProText-Bold", size: 24.0)! , NSAttributedString.Key.foregroundColor: UIColor.black]
        let myString1 = NSMutableAttributedString(string: " (\(String(movieData.releaseDate.prefix(4))))", attributes: myAttributeRegular )
        let myString2 = NSMutableAttributedString(string: "\(movieData.title!)", attributes: myAttributeBold )
        myString2.append(myString1)
        titleLabel.attributedText = myString2
        
        
        let columnLayout = FlowLayout(
                minimumInteritemSpacing: 10,
                minimumLineSpacing: 10,
                sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            )
        generesCollectionView = GeneresCollectionView(frame: CGRect(x: 0, y: 50, width: 1000, height: 270), collectionViewLayout: columnLayout)
        generesCollectionView?.contentInsetAdjustmentBehavior = .always
        generesCollectionView.generesArray = movieData.genres
        generesCollectionView?.dataSource = generesCollectionView as! UICollectionViewDataSource
        generesCollectionView?.delegate = generesCollectionView as! UICollectionViewDelegateFlowLayout
        generesCollectionView?.register(GeneresCollectionViewCell.self, forCellWithReuseIdentifier: "GeneresCollectionViewCell")
        generesCollectionView?.backgroundColor = .clear
        generesCollectionView?.showsVerticalScrollIndicator = false
        generesCollectionView?.showsHorizontalScrollIndicator = false
        generesCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        
        scrollViewContainer.addSubview(generesCollectionView)
        generesCollectionView.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 30).isActive = true
        generesCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
        generesCollectionView.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor, constant: -30).isActive = true
        generesCollectionView.heightAnchor.constraint(equalToConstant:  60).isActive = true
        
        
        scrollViewContainer.addSubview(overviewHeaderLabel)
        overviewHeaderLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 30).isActive = true
        overviewHeaderLabel.topAnchor.constraint(equalTo: generesCollectionView.bottomAnchor, constant: 15).isActive = true
        overviewHeaderLabel.text = "Overview"
        
        scrollViewContainer.addSubview(overviewLabel)
        overviewLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 30).isActive = true
        overviewLabel.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor, constant: -30).isActive = true
        overviewLabel.topAnchor.constraint(equalTo: overviewHeaderLabel.bottomAnchor, constant: 16).isActive = true
        
//        overviewLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 270).isActive = true
//        overviewLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
        overviewLabel.text = movieData.overview!
        
        
        scrollViewContainer.addSubview(keyfactsHeaderLabel)
        keyfactsHeaderLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 30).isActive = true
        keyfactsHeaderLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 30).isActive = true
        keyfactsHeaderLabel.text = "Key Facts"
        
        
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.sectionInset = UIEdgeInsets(top: 50, left: 10, bottom: 10, right: 10)
//        layout.itemSize = CGSize(width: 160, height: 160)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 4
        myCollectionView = KefactsCollectionView(frame: CGRect(x: 0, y: 50, width: 1000, height: 270), collectionViewLayout: layout)
        myCollectionView.keyFactsArray = self.keyfactsData
        myCollectionView?.dataSource = myCollectionView as! UICollectionViewDataSource
        myCollectionView?.delegate = myCollectionView as! UICollectionViewDelegateFlowLayout
        myCollectionView?.register(KeyfactsCollectionViewCell.self, forCellWithReuseIdentifier: "KeyfactsCollectionViewCell")
        myCollectionView?.backgroundColor = .clear
        myCollectionView?.showsVerticalScrollIndicator = false
        myCollectionView?.showsHorizontalScrollIndicator = false
        myCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        scrollViewContainer.addSubview(myCollectionView)
        myCollectionView.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 30).isActive = true
        myCollectionView.topAnchor.constraint(equalTo: keyfactsHeaderLabel.bottomAnchor, constant: 15).isActive = true
        myCollectionView.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor, constant: -30).isActive = true
        myCollectionView.heightAnchor.constraint(equalToConstant:  160).isActive = true
      //  myCollectionView.widthAnchor.constraint(equalToConstant: 430).isActive = true
        
        
        
        scrollViewContainer.bottomAnchor.constraint(equalTo: myCollectionView.bottomAnchor).isActive = true
        
        
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = headerNavigatorContainer.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        headerNavigatorContainer.addSubview(blurEffectView)
        
        self.view.addSubview(headerNavigatorContainer)
        headerNavigatorContainer.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        headerNavigatorContainer.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        headerNavigatorContainer.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        headerNavigatorContainer.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        
        headerNavigatorContainer.addSubview(closePageView)
        closePageView.bottomAnchor.constraint(equalTo: headerNavigatorContainer.bottomAnchor, constant: -10).isActive = true
        closePageView.rightAnchor.constraint(equalTo: headerNavigatorContainer.rightAnchor, constant: -20).isActive = true
        closePageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        closePageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        closePageView.addSubview(closeImageView)
        closeImageView.centerXAnchor.constraint(equalTo: closePageView.centerXAnchor).isActive = true
        closeImageView.centerYAnchor.constraint(equalTo: closePageView.centerYAnchor).isActive = true
        closeImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        closeImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
        headerNavigatorContainer.addSubview(bookmarkFilled)
        bookmarkFilled.bottomAnchor.constraint(equalTo: headerNavigatorContainer.bottomAnchor, constant: -13).isActive = true
        bookmarkFilled.rightAnchor.constraint(equalTo: closePageView.leftAnchor , constant: -20).isActive = true
        bookmarkFilled.widthAnchor.constraint(equalToConstant: 25 ).isActive = true
        bookmarkFilled.heightAnchor.constraint(equalToConstant: 25 ).isActive = true
        
        
        headerNavigatorContainer.addSubview(bookmarkUnfill)
        bookmarkUnfill.bottomAnchor.constraint(equalTo: headerNavigatorContainer.bottomAnchor, constant: -13).isActive = true
        bookmarkUnfill.rightAnchor.constraint(equalTo: closePageView.leftAnchor , constant: -20).isActive = true
        bookmarkUnfill.widthAnchor.constraint(equalToConstant: 25 ).isActive = true
        bookmarkUnfill.heightAnchor.constraint(equalToConstant: 25 ).isActive = true
        
        
        let bookmarkMovieGesture = MyTapGesture(target: self, action: #selector(self.bookmarkMovieTap(_:)))
        bookmarkUnfill.addGestureRecognizer(bookmarkMovieGesture)
        bookmarkUnfill.isUserInteractionEnabled = true

        
        let unbookmarkMovieGesture = MyTapGesture(target: self, action: #selector(self.unbookmarkMovieTap(_:)))
        bookmarkFilled.addGestureRecognizer(unbookmarkMovieGesture)
        bookmarkFilled.isUserInteractionEnabled = true

        
        let closeFavoriteMovieGesture = MyTapGesture(target: self, action: #selector(self.closeFavoriteMovieGestureTap(_:)))
        closePageView.addGestureRecognizer(closeFavoriteMovieGesture)
        closePageView.isUserInteractionEnabled = true

//        if (movieData.bookmark == nil || movieData.bookmark == false ){
//            bookmarkUnfill.isHidden = false
//            bookmarkFilled.isHidden = true
//            
//        }
//        else if (movieData.bookmark != nil && movieData.bookmark == true ){
//            bookmarkUnfill.isHidden = true
//            bookmarkFilled.isHidden = false
//        }
        
        if(Utils.bookamarkedMoviesDict[movieData.id!] != nil){
            bookmarkUnfill.isHidden = true
            bookmarkFilled.isHidden = false
        }else{
            bookmarkUnfill.isHidden = false
            bookmarkFilled.isHidden = true
        }
        
        
        
//        let notificationCenter = NotificationCenter.default
//            notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
//            notificationCenter.addObserver(self, selector: #selector(appCameToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
//        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func bookmarkMovieTap(_ sender: MyTapGesture? = nil){
        let selectedIndexRow = sender?.selectedIndex

        let indexPath = IndexPath(row: selectedIndexRow!, section: 0)
//            let cell = self.cellForRow(at: indexPath) as! MoviesTableViewCell
        
        bookmarkUnfill.isHidden = true
        bookmarkFilled.isHidden = false
        
        Utils.addFavoriteMovie(movieSelected: movieData)
//        print("My Favorite Movies Total: \(Utils.favoriteMovies.count)")
    }
    
    @objc func unbookmarkMovieTap(_ sender: MyTapGesture? = nil){
        let selectedIndexRow = sender?.selectedIndex

        let indexPath = IndexPath(row: selectedIndexRow!, section: 0)
//            let cell = self.cellForRow(at: indexPath) as! MoviesTableViewCell
        
        bookmarkUnfill.isHidden = false
        bookmarkFilled.isHidden = true
       
        Utils.removeFavoriteMovie(movieSelected: movieData)
//        print("My Favorite Movies Total: \(Utils.favoriteMovies.count)")
    }
    
    
    @objc func closeFavoriteMovieGestureTap(_ sender: MyTapGesture? = nil){
        self.dismiss(animated: true)
        
       
        
    }
    
    
   
    

}
