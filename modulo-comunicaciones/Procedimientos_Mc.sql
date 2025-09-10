--Crear Procedmiento de almacenado para listar Usuarios Activos en la sala del chat

CREATE PROCEDURE usp_Listar_Activos
AS
BEGIN
	select room_id as ID_Sala,
	   [name] as Nombre_Del_Chat,
	   is_group as Estado_Activo	
	from rooms
	where is_group = 1
	Order by created_at DESC
END
GO;
--Creando procedimiento almacenado para filtrar numero mensajes por usuario 
CREATE PROCEDURE usp_Filter_Menssage
@number_Words INT
AS
BEGIN
	select u.full_name Nombre_Completo,
	   u.[user_id]	ID_Usuario,
	   m.content,
	   m.sent_at
	   	
	from users as u
	inner join messages as m on u.[user_id] = m.[user_id]
	where LEN(CAST(M.content AS VARCHAR(MAX))) <= @number_Words
END;
GO

