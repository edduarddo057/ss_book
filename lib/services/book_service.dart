import 'package:ss_book/services/graphql_service.dart';

Future<Map<String, dynamic>> requestBooks() {
  return GraphqlService().query(document: """query DataBooks {
  userPicture
  favoriteBooks {
    id
    name
    author {
      name
    }
    cover
  }

  favoriteAuthors {
    name
    picture
    booksCount
  }
  
  allBooks {
    id
    category
    cover
    name
    author {
      name
    }
  }
}""", variables: {}).then((value) {
    return value.data!;
  });
}

Future<Map<String, dynamic>> selectBook({required int bookId}) {
  return GraphqlService().query(document: """ query Book {
	book(id: $bookId) {
  	name
  	author {
      name
    }
    description
    isFavorite
    cover
	}
}""", variables: {}).then((value) => value.data!["book"]);
}
