//
//  MoviesTableView.swift
//  Movie Review
//
//  Created by Globeways Technologies on 13/01/23.
//

import UIKit
import Foundation

protocol MoviesTableViewDelegate: class {
    func updateMovie()
}
extension MoviesTableViewDelegate {
    func updateMovie(){}
}

class MoviesTableView: UITableView , UITableViewDelegate , UITableViewDataSource {
    
    
    var moviesArrayX : [MovieData]! = [MovieData]()
    
    weak var delegateAction: MoviesTableViewDelegate?
    
    override init(frame: CGRect, style: UITableView.Style) {
        //When you manually initializing a table
        super.init(frame: frame, style: style)
    }
    
    init(moviesArray:[MovieData]) {
        moviesArrayX = moviesArray
        super.init(frame: CGRect.zero, style: .plain )
    }
    
    
    required init?(coder: NSCoder) {
        //From xib or storyboard
        super.init(coder: coder)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArrayX.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath) as! MoviesTableViewCell
        
        Utils.insertDisplayableImageInImageView(remoteURLString: moviesArrayX[indexPath.row].posterUrl!, toFolder: "movies", atImageView: cell.movieImageView1, defaultIOSImage: "popcorn.fill")
        
        let showFavoriteMovieGesture = MyTapGesture(target: self, action: #selector(self.showFavoriteMovieGestureTap(_:)))
        cell.movieImageView1.addGestureRecognizer(showFavoriteMovieGesture)
        cell.movieImageView1.isUserInteractionEnabled = true
        showFavoriteMovieGesture.selectedIndex = indexPath.row
        
        let bookmarkMovieGesture = MyTapGesture(target: self, action: #selector(self.bookmarkMovieTap(_:)))
        cell.bookmarkUnfill.addGestureRecognizer(bookmarkMovieGesture)
        cell.bookmarkUnfill.isUserInteractionEnabled = true
        bookmarkMovieGesture.selectedIndex = indexPath.row
        
        let unbookmarkMovieGesture = MyTapGesture(target: self, action: #selector(self.unbookmarkMovieTap(_:)))
        cell.bookmarkFilled.addGestureRecognizer(unbookmarkMovieGesture)
        cell.bookmarkFilled.isUserInteractionEnabled = true
        unbookmarkMovieGesture.selectedIndex = indexPath.row
        
        cell.movieYearLabel.text = String(moviesArrayX[indexPath.row].releaseDate.prefix(4))
        cell.movieNameLabel.text = moviesArrayX[indexPath.row].title
        cell.ratingView.setRating(ratingUnit: Int(round(moviesArrayX[indexPath.row].rating)))
        
        
        if(Utils.bookamarkedMoviesDict[moviesArrayX[indexPath.row].id!] != nil){
            cell.bookmarkUnfill.isHidden = true
            cell.bookmarkFilled.isHidden = false
        }else{
            cell.bookmarkUnfill.isHidden = false
            cell.bookmarkFilled.isHidden = true
        }
        
        
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 115
   }
    
    
    @objc func bookmarkMovieTap(_ sender: MyTapGesture? = nil){
        let selectedIndexRow = sender?.selectedIndex

        let indexPath = IndexPath(row: selectedIndexRow!, section: 0)
        let cell = self.cellForRow(at: indexPath) as! MoviesTableViewCell
        
        cell.bookmarkUnfill.isHidden = true
        cell.bookmarkFilled.isHidden = false
        self.moviesArrayX[selectedIndexRow!].bookmark = true
        Utils.addFavoriteMovie(movieSelected: self.moviesArrayX[selectedIndexRow!])
        delegateAction?.updateMovie()
//        print("My Favorite Movies Total: \(Utils.favoriteMovies.count)")
    }
    
    @objc func unbookmarkMovieTap(_ sender: MyTapGesture? = nil){
        let selectedIndexRow = sender?.selectedIndex

        let indexPath = IndexPath(row: selectedIndexRow!, section: 0)
        let cell = self.cellForRow(at: indexPath) as! MoviesTableViewCell
        
        cell.bookmarkUnfill.isHidden = false
        cell.bookmarkFilled.isHidden = true
        self.moviesArrayX[selectedIndexRow!].bookmark = false
        Utils.removeFavoriteMovie(movieSelected: self.moviesArrayX[selectedIndexRow!])
        delegateAction?.updateMovie()
//        print("My Favorite Movies Total: \(Utils.favoriteMovies.count)")
        
    }
    
    @objc func showFavoriteMovieGestureTap(_ sender: MyTapGesture? = nil){
        let selectedIndexRow = sender?.selectedIndex

        let indexPath = IndexPath(row: selectedIndexRow!, section: 0)
        let cell = self.cellForRow(at: indexPath) as! MoviesTableViewCell
        
        let secondVC = DetailViewController(movieData: moviesArrayX[selectedIndexRow!])
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .coverVertical
        secondVC.view.isOpaque = false
        
        UIApplication.getTopViewController()!.present(secondVC, animated: true)
        
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
