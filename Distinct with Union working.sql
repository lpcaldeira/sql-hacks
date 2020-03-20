SELECT tabela, id_paciente, nome, foto, id, data_visualizacao
FROM
(
	SELECT 'addendum' AS tabela, IFNULL(p.id_paciente, '') AS id_paciente, IFNULL(p.nome, '') AS nome, IFNULL(p.foto, '') AS foto, id_ficha_adendo AS id, data_visualizacao
	FROM ficha_adendo fa
	JOIN paciente p ON p.id_paciente = fa.id_paciente
	WHERE id_contratante_usuario = 'id_contratante_usuario_value' AND data_visualizacao IS NOT NULL
	
	UNION
	
	SELECT 'attestation' AS tabela, IFNULL(p.id_paciente, '') AS id_paciente, IFNULL(p.nome, '') AS nome, IFNULL(p.foto, '') AS foto, id_atestado AS id, data_visualizacao
	FROM atestado at
	JOIN paciente p ON p.id_paciente = at.id_paciente
	WHERE id_contratante_usuario = 'id_contratante_usuario_value' AND data_visualizacao IS NOT NULL
	
	ORDER BY data_visualizacao DESC
	LIMIT 30
) T1
GROUP BY id_paciente
LIMIT 3;