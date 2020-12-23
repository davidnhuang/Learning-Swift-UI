/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

// swiftlint:disable multiple_closures_with_trailing_closure
struct MovieList: View {
  @Environment(\.managedObjectContext) var managedObjectContext
  // 1.
  @FetchRequest(
    // 2.
    entity: Movie.entity(),
    // 3.
    sortDescriptors: [
      NSSortDescriptor(keyPath: \Movie.title, ascending: true)
    ]
    //,predicate: NSPredicate(format: "genre contains 'Action'")
    // 4.
  ) var movies: FetchedResults<Movie>

  @State var isPresented = false

  var body: some View {
    NavigationView {
      List {
        ForEach(movies, id: \.title) {
          MovieRow(movie: $0)
        }
        .onDelete(perform: deleteMovie)
      }
      .sheet(isPresented: $isPresented) {
        AddMovie { title, genre, release in
          self.addMovie(title: title, genre: genre, releaseDate: release)
          self.isPresented = false
        }
      }
      .navigationBarTitle(Text("Fave Flicks"))
      .navigationBarItems(trailing:
        Button(action: { self.isPresented.toggle() }) {
          Image(systemName: "plus")
        }
      )
    }
  }

  func deleteMovie(at offsets: IndexSet) {
    // 1.
    offsets.forEach { index in
      // 2.
      let movie = self.movies[index]

      // 3.
      self.managedObjectContext.delete(movie)
    }

    // 4.
    saveContext()
  }


  func addMovie(title: String, genre: String, releaseDate: Date) {
    // 1
    let newMovie = Movie(context: managedObjectContext)

    // 2
    newMovie.title = title
    newMovie.genre = genre
    newMovie.releaseDate = releaseDate

    // 3
    saveContext()
  }


  func saveContext() {
    do {
      try managedObjectContext.save()
    } catch {
      print("Error saving managed object context: \(error)")
    }
  }
}

struct MovieList_Previews: PreviewProvider {
  static var previews: some View {
    MovieList()
  }
}
