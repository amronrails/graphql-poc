const { ApolloServer } = require('apollo-server');
const { ApolloGateway } = require('@apollo/gateway');

const gateway = new ApolloGateway({
  serviceList: [
    { name: 'users', url: 'http://localhost:3000/graphql/user_service' },
    { name: 'items', url: 'http://localhost:3000/graphql/item_service' },
    { name: 'roles', url: 'http://localhost:3000/graphql/role_service' },
  ],
  debug: true,
});

(async () => {
  const server = new ApolloServer({ gateway, subscriptions: false });

  server.listen({ port: 5000 }).then(({ url }) => {
    console.log(`🚀 Server ready at ${url}`);
  });
})();
