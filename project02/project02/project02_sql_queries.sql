
  /*Select the web19101 database and using the SQL tab run the following query */
  
  CREATE TABLE web19101.authors (
  author_id int not NULL auto_increment,
  first_name varchar(255) NULL,
  last_name  varchar(255) NULL,
  email      varchar(255) NULL,
  phone      varchar(255) NULL,
  create_dt  date NULL,
  primary key (author_id));

/*Select the web19101 database and using the SQL tab run the following query */

  ALTER TABLE web19101.captions
  ADD COLUMN author_id INT AFTER caption;
  
/*Select the authors table and using the SQL tab run the following queries */

  insert into authors(first_name, last_name, email, phone, create_dt)
  values('John', 'Smith', 'jsmith@hotmail.com', '618 622-0001', sysdate());
  insert into authors(first_name, last_name, email, phone, create_dt)
  values('Akim', 'Obedella', 'aobedella@hotmail.com', '212 601-1112', sysdate());
  insert into authors(first_name, last_name, email, phone, create_dt)
  values('Jen', 'Potifer', 'jpotifer@yahoo.com', '812 567-3332', sysdate());
  insert into authors(first_name, last_name, email, phone, create_dt)
  values('Mabel', 'Hartford', 'mhartford@gmail.com', '246 756-4443', sysdate());

/*Select the captions table and using the SQL tab run the following queries */

  update web19101.captions set author_id = 1 where caption_id in(1, 2, 3, 4);
  update web19101.captions set author_id = 2 where caption_id in(5, 6, 7, 8);
  update web19101.captions set author_id = 3 where caption_id in(9, 10, 11, 12);
  update web19101.captions set author_id = 4 where caption_id in(13, 14);