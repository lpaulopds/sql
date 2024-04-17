-- Query for seach
SELECT f.nome, f.email, f.departamento, f.cargo, l.localizacao
    FROM funcionarios f
        INNER JOIN localizacao l
            ON f.idregiao = l.idregiao
                WHERE nome ILIKE 'kelley'
                    OR email ILIKE 'rkelley0@soundcloud.com';

-- Query for select
SELECT f.nome, l.localizacao
    FROM funcionarios f
        INNER JOIN localizacao l
            ON f.idregiao = l.idregiao;
