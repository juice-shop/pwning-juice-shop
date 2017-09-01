# Architecture overview

The OWASP Juice Shop is a pure web application implemented in
Javascript. In the frontend the popular
[AngularJS](https://angularjs.org/) framework is used to create a
so-called _Single Page Application_. The user interface layout is
provided by Twitter's [Bootstrap](http://getbootstrap.com) framework -
which works nicely in combination with AngularJS.

Javascript is also used in the backend as the exclusive programming
language: An [Express](http://expressjs.com) application hosted in a
[Node.js](https://nodejs.org) server delivers the client-side code to
the browser. It also provides the necessary backend functionality to the
client via a RESTful API. As an underlying database a light-weight
[SQLite](https://www.sqlite.org) was chosen, because of its file-based
nature. This makes the database easy to create from scratch
programmatically without the need for a dedicated server.
[Sequelize](http://docs.sequelizejs.com) (with accompanying
[sequelize-restful](https://github.com/sequelize/sequelize-restful)
extension) is used as an abstraction layer to the database. This allows
to use a dynamically created API for simple interactions (i.e. CRUD
operations) with database resources while still allowing to execute
custom SQL for more complex queries.

As an additional datastore a [MarsDB](https://github.com/c58/marsdb) was
introduced with the release of OWASP Juice Shop 5.x. It is a Javascript
derivate of the widely used [MongoDB](https://www.mongodb.com) NoSQL
database and compatible with most of its query/modify operations.

The push notifications that are shown when a challenge was successfully
hacked, are implemented via
[WebSocket Protocol](https://tools.ietf.org/html/rfc6455). The
application also offers convenient user registration via
[OAuth 2.0](https://oauth.net/2/) so users can sign in with their Google
accounts.

The following diagram shows the high-level communication paths between
the client, server and data layers:

![Architecture overview diagram](img/architecture-diagram.png)
