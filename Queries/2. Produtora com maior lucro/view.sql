CREATE VIEW `dasa-project-01-288519.dasa_movie_dataset_01.produtora_maior_lucro_dez_anos_vw` AS
            ( 
                     SELECT   sum(a.revenue)         AS receita, 
                              sum(a.budget)          AS orcamento, 
                              (a.revenue - a.budget) AS lucro, 
                              p.NAME 
                     FROM     `dasa-project-01-288519.dasa_movie_dataset_01.movie_details_tb` AS a, 
                              unnest(production_companies)                                    AS p
                     WHERE    ( 
                                       a.id IN 
                                       ( 
                                              SELECT id 
                                              FROM   `dasa-project-01-288519.dasa_movie_dataset_01.now_playing_tb`) 
                              OR       a.id IN 
                                       ( 
                                              SELECT id 
                                              FROM   `dasa-project-01-288519.dasa_movie_dataset_01.upcoming_tb`)) 
                     AND      a.release_date > 
                              ( 
                                     SELECT date_add(CURRENT_DATE(), interval -10 year)) 
                     GROUP BY p.NAME, 
                              lucro 
                     ORDER BY lucro DESC 
            );