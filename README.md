SALON
=====

by DAVID GARBER
===============

REQUIREMENTS
============

Ruby v. 2.2.2 POSTGRES v. 9.4.1

INSTALLATION
============

Run command $ postgres in terminal.

Run command $ psql to start PSQL.

To create databases in PSQL type the following: # CREATE DATABASE hair_salon;
# \c hair_salon; # CREATE TABLE stylists (id serial PRIMARY KEY, name varchar, stylist_id int);
# CREATE TABLE clients (id serial PRIMARY KEY, name varchar, client_id int);
# CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
# CREATE TABLE stylists_clients (id serial PRIMARY KEY, stylist_id int, client_id int);

In Bash run: $ bundle install

then run: $ ruby app.rb

In your browser go to: localhost:4567

ABOUT
=====

Salon is a program where a user can add stylists, add clients, delete stylists, delete clients and, ideally, place clients under stylists.

COPYRIGHT 2015
==============

LICENSING
=========

It's yours.

KNOWN BUGS
==========

How much time do you have?

DATABASE
========

CREATE DATABASE
hair_salon=# \dt
                List of relations
 Schema |       Name       | Type  |    Owner
--------+------------------+-------+-------------
 public | clients          | table | davidgarber
 public | stylists         | table | davidgarber
 public | stylists_clients | table | davidgarber
(3 rows)

hair_salon=# \d stylists_clients
 id         | integer | not null default nextval('stylists_clients_id_seq'::regclass)
 stylist_id | integer |
 client_id  | integer |

hair_salon=# \d clients
 id        | integer           | not null default nextval('clients_id_seq'::regclass)
 name      | character varying |
 client_id | integer           |

hair_salon=# \d stylists
 id         | integer           | not null default nextval('stylists_id_seq'::regclass)
 name       | character varying |
 stylist_id | integer           |

hair_salon=#
