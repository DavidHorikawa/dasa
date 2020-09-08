CREATE VIEW `dasa-project-01-288519.dasa_movie_dataset_01.paises_maior_numero_de_filmes_tb` AS 
            ( 
                     SELECT   count(coun.iso_3166_1) AS numero_filmes, 
                              coun.NAME 
                     FROM     `dasa-project-01-288519.dasa_movie_dataset_01.movie_details_tb` AS det, 
                              unnest(production_countries)                                    AS coun,
                              unnest(production_companies)                                    AS comp
                     WHERE    coun.iso_3166_1 = comp.origin_country 
                     GROUP BY coun.NAME 
                     ORDER BY numero_filmes DESC 
            );