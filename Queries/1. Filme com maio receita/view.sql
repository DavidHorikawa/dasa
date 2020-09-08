CREATE view 
`dasa-project-01-288519.dasa_movie_dataset_01.filme_maior_receita_vw` 
AS 
  (SELECT title   AS Titulo, 
          id      AS ID, 
          revenue AS Receita, 
          budget  AS Orcamento 
   FROM   `dasa-project-01-288519.dasa_movie_dataset_01.movie_details_tb` 
   WHERE  revenue = (SELECT Max(revenue) 
                     FROM 
          `dasa-project-01-288519.dasa_movie_dataset_01.movie_details_tb` 
           ) 
          AND id IN (SELECT id 
                     FROM 
              `dasa-project-01-288519.dasa_movie_dataset_01.now_playing_tb`)); 