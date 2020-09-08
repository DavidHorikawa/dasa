CREATE VIEW `dasa-project-01-288519.dasa_movie_dataset_01.tres_generos_maior_numero_filmes_vw` AS 
            ( 
                     SELECT   count(gen.id) AS numero_filmes, 
                              gen.NAME, 
                              gen.id 
                     FROM     `dasa-project-01-288519.dasa_movie_dataset_01.movie_details_tb` AS det, 
                              unnest(genres)                                                  AS gen
                     WHERE    det.release_date > 
                              ( 
                                     SELECT date_add(CURRENT_DATE(), interval -5 year)) 
                     GROUP BY gen.NAME, 
                              gen.id 
                     ORDER BY numero_filmes DESC limit 3 
            );