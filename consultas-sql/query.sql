SELECT id, compositor FROM musicas;

SELECT composicao, tempo FROM musicas WHERE tempo > 240;

SELECT compositor, composicao FROM musicas WHERE id BETWEEN 47 AND 123;

SELECT * FROM musicas WHERE compositor IS NOT NULL AND tempo < 300 AND compositor != 'Bach' ORDER BY tempo ASC;

SELECT composicao, tempo FROM musicas WHERE compositor = 'Mozart' OR compositor = 'Bach';

SELECT * FROM musicas ORDER BY id DESC;

SELECT * FROM musicas ORDER BY tempo DESC;

SELECT * FROM musicas ORDER BY tempo ASC LIMIT 5;

SELECT * FROM musicas ORDER BY tempo DESC LIMIT 10;

SELECT * FROM musicas ORDER BY tempo ASC LIMIT 10 OFFSET 5;

SELECT * FROM musicas LIMIT 10 OFFSET 30;

SELECT * FROM musicas LIMIT 12 OFFSET 60;

SELECT DISTINCT compositor FROM musicas WHERE compositor IS NOT NULL;

SELECT DISTINCT compositor, composicao FROM musicas;

SELECT * FROM musicas WHERE compositor like 'Bra%';

SELECT * FROM musicas WHERE ritmo ilike '%troppo';

SELECT * FROM musicas WHERE composicao ilike '%quartet%';

SELECT * FROM musicas WHERE composicao NOT ILIKE '%quintet%';