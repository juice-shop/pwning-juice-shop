# Architecture overview

The OWASP Juice Shop is a pure web application implemented in Javascript. In the frontend the popular [Angular.js]() framework is used to create a so-called _Single Page Application_. The user interface layout is provided by Twitter's [Bootstrap]() framework - which works nicely in combination with Angular.js.

Javascript is also used in the backend as the exclusive programming language: An [Express]() application hosted in a [Node.js]() server delivers the client-side code to the browser. It also provides the necessary backend functionality to the client via a RESTful API. As an underlying database [SQLite]() was chosen, because it is very light-weight and easy to reset if it gets corrupted. [Sequelize]() (with the accompanying [sequelize-restful]() extension) is used as an abstraction layer to the database. This allows to use a dynamically created API for simple interactions (i.e. CRUD operations) with database resources while still allowing to execute custom SQL for more complex queries.

The following diagram shows the high-level communication paths between the client, server and data layers:

![Architecture overview diagram](img/architecture-diagram.png)
