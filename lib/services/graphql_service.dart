import 'package:graphql/client.dart';

class GraphqlService {
  final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: HttpLink(
      'https://us-central1-ss-devops.cloudfunctions.net/GraphQL',
    ),
  );

  Future<QueryResult<Object>> mutation(
      {required String document, required Map<String, dynamic> variables}) {
    return client.mutate(MutationOptions(
      document: gql(document),
      variables: variables,
    ));
  }

  Future<QueryResult<Object>> query(
      {required String document, required Map<String, dynamic> variables}) {
    return client.query(QueryOptions(
      document: gql(document),
      variables: variables,
    ));
  }
}
