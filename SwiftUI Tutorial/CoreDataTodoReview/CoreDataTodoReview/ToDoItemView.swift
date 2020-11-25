//
//  ToDoItemView.swift
//  CoreDataTodoReview
//
//  Created by David N. Huang on 10/25/20.
//

import SwiftUI

struct ToDoItemView: View {
	var title: String = ""
	var createdAt: String = ""
	
    var body: some View {
		HStack {
			VStack(alignment: .leading) {
				Text(title).font(.headline)
				Text(createdAt).font(.caption)
			}
		}
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView()
    }
}
