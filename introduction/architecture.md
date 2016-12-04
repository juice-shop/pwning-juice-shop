# Architecture overview

The OWASP Juice Shop is a pure web application implemented in
Javascript. In the frontend the popular Angular.js framework is used to
create a so-called _Single Page Application_. The user interface layout
is provided by Twitter's Bootstrap framework - which works nicely in
combination with Angular.js.

Javascript is also used in the backend as the exclusive programming
language: An Express.js application hosted in a Node.js server delivers
the client-side code to the browser. It also provides the necessary
backend functionality to the client via a RESTful API. As an underlying
database a light-weight SQLite was chosen, because of its file-based
nature. This makes the database easy to create from scratch
programmatically without the need for a dedicated server. Sequelize
(with accompanying sequelize-restful extension) is used as an
abstraction layer to the database. This allows to use a dynamically
created API for simple interactions (i.e. CRUD operations) with database
resources while still allowing to execute custom SQL for more complex
queries.

The push notifications that are shown when a challenge was successfully
hacked, are implemented via WebSocket protocol using socket.io which is
the most prominent Javascript library in that space. The application
also offers convenient user registration via OAuth 2.0 so users can sign
in with their Google accounts.

The following diagram shows the high-level communication paths between
the client, server and data layers:

![Architecture overview diagram](img/architecture-diagram.png)
