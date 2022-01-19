Microsoft Windows [Version 10.0.19042.1348]
(c) Microsoft Corporation. All rights reserved.

C:\Windows\System32>path = C:\Program Files\PostgreSQL\14\bin

C:\Windows\System32>psql --port=5433 --host=localhost --dbname=northwind --username=postgres
psql: error: connection to server at "localhost" (::1), port 5433 failed: Connection refused (0x0000274D/10061)
        Is the server running on that host and accepting TCP/IP connections?
connection to server at "localhost" (127.0.0.1), port 5433 failed: Connection refused (0x0000274D/10061)
        Is the server running on that host and accepting TCP/IP connections?

C:\Windows\System32>psql --port=5432 --host=localhost --dbname=northwind --username=postgres
Password for user postgres:
psql (14.1)
WARNING: Console code page (437) differs from Windows code page (1252)
         8-bit characters might not work correctly. See psql reference
         page "Notes for Windows users" for details.
Type "help" for help.

northwind=# select * from orders;
 orderid | customerid | employeeid | orderdate  | requireddate | shippeddate | shipvia | freight |              shipname              |                  shipaddress                   |    shipcity     |  shipregion   | shippostalcode | shipcountry
---------+------------+------------+------------+--------------+-------------+---------+---------+------------------------------------+------------------------------------------------+-----------------+---------------+----------------+-------------
   10248 | VINET      |          5 | 1996-07-04 | 1996-08-01   | 1996-07-16  |       3 |   32.38 | Vins et alcools Chevalier          | 59 rue de l'Abbaye                             | Reims           |               | 51100          | France
   10249 | TOMSP      |          6 | 1996-07-05 | 1996-08-16   | 1996-07-10  |       1 |   11.61 | Toms SpezialitSten                 | Luisenstr. 48                                  | Mnnster         |               | 44087          | Germany
   10250 | HANAR      |          4 | 1996-07-08 | 1996-08-05   | 1996-07-12  |       2 |   65.83 | Hanari Carnes                      | Rua do Pato, 67                                | Rio de Janeiro  | RJ            | 05454-876      | Brazil
   10251 | VICTE      |          3 | 1996-07-08 | 1996-08-05   | 1996-07-15  |       1 |   41.34 | Victuailles en stock               | 2, rue du Commerce                             | Lyon            |               | 69004          | France
   10252 | SUPRD      |          4 | 1996-07-09 | 1996-08-06   | 1996-07-11  |       2 |    51.3 | SuprOmes dTlices                   | Boulevard Tirou, 255                           | Charleroi       |               | B-6000         | Belgium
   10253 | HANAR      |          3 | 1996-07-10 | 1996-07-24   | 1996-07-16  |       2 |   58.17 | Hanari Carnes                      | Rua do Pato, 67                                | Rio de Janeiro  | RJ            | 05454-876      | Brazil
   10254 | CHOPS      |          5 | 1996-07-11 | 1996-08-08   | 1996-07-23  |       2 |   22.98 | Chop-suey Chinese                  | Hauptstr. 31                                   | Bern            |               | 3012           | Switzerland
   10255 | RICSU      |          9 | 1996-07-12 | 1996-08-09   | 1996-07-15  |       3 |  148.33 | Richter Supermarkt                 | Starenweg 5                     zerland
   10256 | WELLI      |          3 | 1996-07-15 | 1996-08-12   | 1996-07-17  |       2 |   13.97 | Wellington Importadora             | Rua do Mercado, 12                             | Resende         | SP            | 08737-363      | Brazil
^Cnorthwind=#