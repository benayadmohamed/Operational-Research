INSERT INTO Auteurs VALUES ( 55, 'Abmayr W', 'Abmayr@cs.fhm.edu', 'http://www.informatik.fh-muenchen.de/~abmayr/abmayre.htm');
INSERT INTO Auteurs VALUES ( 20, 'Aho A', 'aho@cs.columbia.edu',  'http://www1.cs.columbia.edu/~aho/');
INSERT INTO Auteurs VALUES ( 21, 'Hopcroft J', 'jeh@cs.cornell.edu', 'http://www.cs.cornell.edu/jeh/');
INSERT INTO Auteurs VALUES ( 22, 'Ullman J', 'ullman@cs.stanford.edu', 'http://infolab.stanford.edu/~ullman/');
INSERT INTO Auteurs VALUES ( 23, 'Akl S', 'akl@cs.queensu.ca', 'http://www.cs.queensu.ca/~akl/');
INSERT INTO Auteurs VALUES ( 25, 'Adams R', null, null);
INSERT INTO Auteurs VALUES ( 26, 'Bischof L', 'Leanne.Bischof@csiro.au', 'http://www.cmis.csiro.au/leanne.bischof/ ');
INSERT INTO Auteurs VALUES ( 24, 'Toussaint G', 'godfried@cs.mcgill.ca', 'http://www-cgrl.cs.mcgill.ca/~godfried/');
INSERT INTO Auteurs VALUES ( 28, 'Powley W', 'wendy@cs.queensu.ca', 'http://www.cs.queensu.ca/home/wendy/');
INSERT INTO Auteurs VALUES ( 10, 'Amadasun M','amadasun@cs.stanford.edu', 'http://infolab.stanford.edu/~amadasun/');
INSERT INTO Auteurs VALUES ( 12, 'King R','king@cs.stanford.edu', 'http://infolab.stanford.edu/~king/');

INSERT INTO Editeurs VALUES (1, 'Teubner', '611 7878-285', '611 7878-420', 'Germany'); 
INSERT INTO Editeurs VALUES (2, 'Addison-Wesley', '415 402-2500', '415 402-2590', 'United States'); 
INSERT INTO Editeurs VALUES (3, 'elsevier', '20 7611 4500', '20 7611 4501', 'United Kingdom');
INSERT INTO Editeurs VALUES (4, 'asprs', '01 8038 6860', '01 8038 6861', 'United Kingdom');
INSERT INTO Editeurs VALUES (5, 'ieee-smc', '202 371-0101', '202 728-9614', 'United States'); 

INSERT INTO Revues VALUES (11,'Computer Vision, Graphics, and Image Processing: Graphical Models and Image Processing', 5, 1989);
INSERT INTO Revues VALUES (2,'Information Processing Letters', 2, 1979);
INSERT INTO Revues VALUES (8,'Transactions on Pattern Analysis and Machine intelligence', 1, 1965);
INSERT INTO Revues VALUES (31,'Pattern Recognition', 3, 1965);
INSERT INTO Revues VALUES (9,'Photogrammetric Engineering and Remote Sensing', 4, 1988);
INSERT INTO Revues VALUES (1,'Transactions on Systems, Man, and Cybernetics', NULL, 1962);
INSERT INTO Revues VALUES (12,'Proc. of Geovision 99: International Symposium on Imaging Applications in Geology', 5, 1984);
INSERT INTO Revues VALUES (35,'Physical Review', 2, 1985);
INSERT INTO Revues VALUES (7,'Multimedia Tools and Applications, February 2000', 5, 1984);

INSERT INTO Ouvrages VALUES (23, 'Einfuhrung in die digitale Bildverarbeitung', 1, 1994);
INSERT INTO Ouvrages VALUES (15, 'Data structures and algorithms', 2, 1983);

INSERT INTO Articles VALUES (8, 35, 'Are randomly grown graphs really random', 121, 129, 64, 2); 
INSERT INTO Articles VALUES (11, 31, 'Some refinements of rough k-means clustering', 1481, 1491, 39, 8); 
INSERT INTO Articles VALUES (12, 8, 'Seeded region growing', 641, 647, 16, 6);
INSERT INTO Articles VALUES (41, 11, 'Radial decomposition of discs and spheres.', 325, 332, 55, 5);
INSERT INTO Articles VALUES (17, 2, 'Fast convex hull algorithm', 219, 222, 7, 5);
INSERT INTO Articles VALUES (19, 7, 'A Middleware for Broadband Networks.', 17, 19, 10, 2);
INSERT INTO Articles VALUES (25, 31, 'Low-level segmentation of multispectral images via agglomerative clustering of uniform neighbourhoods.', 216, 218, 21, 1);
INSERT INTO Articles VALUES (1,1,'Mental workload dynamics in adaptive interface design', 20,40,1,1);


INSERT INTO MotCles VALUES (1, 'pattern recognition', null);
INSERT INTO MotCles VALUES (2, 'segmentation', null);
INSERT INTO MotCles VALUES (3, 'graph theory', null);
INSERT INTO MotCles VALUES (4, 'image processing', null);
INSERT INTO MotCles VALUES (5, 'hull', null);
INSERT INTO MotCles VALUES (6, 'broadband Networks', null);

INSERT INTO Organismes VALUES (1, 'Munich University of Applied Sciences Department of Computer Science', '+49 89 1265-1643', 'Germany');
INSERT INTO Organismes VALUES (2, 'Computer Science Department Cornell University', '607 255-5396', 'United States');  
INSERT INTO Organismes VALUES (3, 'Department of Computer Science Columbia University 513 Computer Science Building', '212 666-0140', 'United States');
INSERT INTO Organismes VALUES (4, 'Computer Science Department, gates Computer Science Bldg. , Stanford University', '650 725-2588', 'United States'); 
INSERT INTO Organismes VALUES (5, 'School of Computing, Queens University Kingston', '613 533-6513', 'Canada');
INSERT INTO Organismes VALUES (6, 'School of Computer Science, University McConnell', '613 533-6000', 'Canada');
INSERT INTO Organismes VALUES (7, 'Fakultät für Informatik, Karlsruhe Universitäts', '49 21 608-3978', 'Germany');  
INSERT INTO Organismes VALUES (8, 'CSIRO Mathematical and Information Sciences, Macquarie University Campus', '61 2 9325 3200', 'Australia');

INSERT INTO ArticleMotCles VALUES (41, 1);
INSERT INTO ArticleMotCles VALUES (41, 2);
INSERT INTO ArticleMotCles VALUES (41, 4);
INSERT INTO ArticleMotCles VALUES (17, 4);
INSERT INTO ArticleMotCles VALUES (17, 5);
INSERT INTO ArticleMotCles VALUES (19, 6);
INSERT INTO ArticleMotCles VALUES (19, 3);
INSERT INTO ArticleMotCles VALUES (25, 1);
INSERT INTO ArticleMotCles VALUES (25, 2);
INSERT INTO ArticleMotCles VALUES (25, 3);
INSERT INTO ArticleMotCles VALUES (25, 4);
INSERT INTO ArticleMotCles VALUES (11, 1);
INSERT INTO ArticleMotCles VALUES (11, 4);

INSERT INTO OuvragesAuteurs VALUES (23, 55);
INSERT INTO OuvragesAuteurs VALUES (15, 20);
INSERT INTO OuvragesAuteurs VALUES (15, 21);
INSERT INTO OuvragesAuteurs VALUES (15, 22);

INSERT INTO ArticlesAuteurs VALUES(12, 25);
INSERT INTO ArticlsAuteurs VALUES(12, 26);
INSERT INTO ArticlesAuteurs VALUES(8, 21);
INSERT INTO ArticlesAuteurs VALUES(41, 25);
INSERT INTO ArticlesAuteurs VALUES(17, 23);
INSERT INTO ArticlesAuteurs VALUES(17, 24);
INSERT INTO ArticlesAuteurs VALUES(19, 28);
INSERT INTO ArticlesAuteurs VALUES(19, 23);
INSERT INTO ArticlesAuteurs VALUES(25, 10);
INSERT INTO ArticlesAuteurs VALUES(25, 12);
INSERT INTO ArticlesAuteurs VALUES(11, 20);
INSERT INTO ArticlesAuteurs VALUES(11, 21);
INSERT INTO ArticlesAuteurs VALUES(11, 12);
INSERT INTO ArticlesAuteurs VALUES(1,25);


INSERT INTO AuteursOrganismes VALUES (55, 1);
INSERT INTO AuteursOrganismes VALUES (20, 3);
INSERT INTO AuteursOrganismes VALUES (21, 2);
INSERT INTO AuteursOrganismes VALUES (22,4);
INSERT INTO AuteursOrganismes VALUES (23, 5);
INSERT INTO AuteursOrganismes VALUES (25, 7);
INSERT INTO AuteursOrganismes VALUES (26, 8);
INSERT INTO AuteursOrganismes VALUES (24, 5);
INSERT INTO AuteursOrganismes VALUES (24, 6);
INSERT INTO AuteursOrganismes VALUES (28, 5);
INSERT INTO AuteursOrganismes VALUES (10, 4);
INSERT INTO AuteursOrganismes VALUES (12, 4);