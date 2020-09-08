CREATE VIEW `dasa-project-01-288519.dasa_movie_dataset_01.diretor_maior_orcamento_vw` AS 
            ( 
                       SELECT     crew.NAME, 
                                  sum(det.budget) AS orcamento, 
                                  det.title, 
                                  crew.job, 
                                  det.release_date, 
                                  det.id 
                       FROM       `dasa-project-01-288519.dasa_movie_dataset_01.movie_credits_tb` AS cred, 
                                  unnest(crew)                                                    AS crew
                       INNER JOIN `dasa-project-01-288519.dasa_movie_dataset_01.movie_details_tb` det 
                       ON         det.id = cred.id 
                       AND        crew.job = 'Director' 
                       GROUP BY   crew.NAME, 
                                  det.title, 
                                  crew.job, 
                                  det.release_date, 
                                  det.id 
                       HAVING     det.release_date > 
                                  ( 
                                         SELECT date_add(CURRENT_DATE(), interval -20 year)) 
                       ORDER BY   orcamento DESC 
            );