--> 2A: Count different Acacia plant entries from Taxonomy
SELECT COUNT(*) AS acacia_count
FROM taxonomy
WHERE species LIKE '%Acacia%';


--> 2B: Type of wheat with longest DNA Sequence
SELECT
    t.species AS wheat_type,
    LENGTH(r.rfamseq) AS sequence_length
FROM rfamseq AS r
JOIN taxonomy AS t
    ON r.ncbi_id = t.ncbi_id
WHERE t.species LIKE '%wheat%'
ORDER BY sequence_length DESC
LIMIT 1;


--> 2C: Generating list with mentioned requirements
SELECT
    f.rfam_acc AS family_accession,
    f.rfam_id AS family_name,
    MAX(LENGTH(r.rfamseq)) AS max_sequence_length
FROM family AS f
JOIN full_region AS fr
    ON f.rfam_acc = fr.rfam_acc
JOIN rfamseq AS r
    ON fr.rfamseq_acc = r.rfamseq_acc
GROUP BY
    f.rfam_acc,
    f.rfam_id
HAVING MAX(LENGTH(r.rfamseq)) > 1000000
ORDER BY max_sequence_length DESC
LIMIT 15 OFFSET 120;


--> End
