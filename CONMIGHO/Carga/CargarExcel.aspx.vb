Imports System
Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.IO
Imports System.Web.Configuration
Imports DevExpress.Web

Partial Class Carga_CargarExcel
    Inherits System.Web.UI.Page
    Public strSQL As String
    Public cadenaConexion As String = WebConfigurationManager.ConnectionStrings("SqlServices").ConnectionString
    Public conexion As SqlConnection
    Public comando As SqlCommand
    Public objDataReader As SqlDataReader
    Public operacion As Integer
    Public totalItemSeleccionados As Integer = 0
    Public ConexionString As String
    Public Adapter As New SqlDataAdapter
    Public cmd As New SqlCommand
    Public dataset As New DataSet

    Public Sub cargardatos(ByVal nombrehojas As String)
        If txtNombreHoja.Text <> "" Then

            'Cargamos el Archivo Temporalmete'
            If FileUpload1.HasFile Then
                Dim FecCarga As Date = Now()
                Dim uploadFolder As String = MapPath(ConfigurationManager.AppSettings.Get("DirCargaFuentesExternas")) & Format(FecCarga, "yyyyMMddHHmmss")
                Dim FileName As String = FileUpload1.FileName
                FileUpload1.SaveAs(uploadFolder & FileName)

                Dim fs As New System.IO.FileStream(uploadFolder & FileName, FileMode.Open)
                fs.Close()
                ' FileUpload1.Dispose()


                'Obtenemos el archivo cargado
                Dim uploadFile As String = MapPath(ConfigurationManager.AppSettings.Get("DirCargaFuentesExternas")) & Format(FecCarga, "yyyyMMddHHmmss") & FileName

                If FileName.ToString <> "" Then
                    Dim rutaOrigen As String = Path.GetDirectoryName(FileUpload1.PostedFile.FileName)
                    Dim ExcelFile As String = FileName.ToString 'FileUpload1.FileName.ToString
                    Dim extension As String = Path.GetExtension(ExcelFile)
                    Dim xSheet As String = ""
                    Dim ds As New DataSet
                    Dim da As OleDbDataAdapter
                    Dim dt As DataTable
                    Dim conn As OleDbConnection
                    Dim cadena, connbase As String

                    If extension = ".xls" Or extension = ".xlsx" Then
                        connbase = ""

                        xSheet = txtNombreHoja.Text 'InputBox("Digite el nombre de la Hoja que desea importar", "Complete")

                        'If extension = ".xls" Then
                        '    'connbase = "Provider=Microsoft.Jet.OLEDB.4.0;Data source='{0}'; Extended Properties='Excel 8.0; HDR=Yes; IMEX=2;';"
                        '    connbase = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source='{0}';Extended Properties='Excel 12.0;HDR=Yes;IMEX=1;';"
                        '    'conn = New OleDbConnection("Provider = Microsoft.Jet.OLEDB.4.0; Data Source='" & ExcelFile & " '; " & "';Extended Properties=Excel 8.0;")
                        'ElseIf extension = ".xlsx" Then
                        '    connbase = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source='{0}';Extended Properties='Excel 12.0;HDR=Yes;IMEX=1;';"
                        '    ' connbase = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source='{0}'; Jet OLEDB:Database Extended Properties='Excel 12.0; HDR=Yes; IMEX=2;';"
                        '    'conn = New OleDbConnection(
                        '    '          "Provider=Microsoft.ACE.OLEDB.12.0;" &
                        '    '          "data source=" & ExcelFile & "; " &
                        '    '         "Extended Properties='Excel 12.0 Xml;HDR=Yes'")
                        'End If

                        connbase = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source='{0}';Extended Properties='Excel 12.0;HDR=Yes;IMEX=1;';"

                        Try

                            Dim connectionString As String = String.Format(connbase, uploadfile)
                            conn = New OleDbConnection(connectionString)
                            'da = New OleDbDataAdapter("SELECT * FROM  [" & xSheet & "$]", conn)
                            cadena = "Select * From [" & xSheet & "$]"

                            da = New System.Data.OleDb.OleDbDataAdapter(cadena, connectionString)
                            conn.Open()
                            da.Fill(ds, "MyData")
                            dt = ds.Tables("MyData")
                            gv.DataSource = ds
                            gv.DataMember = "MyData"
                            ' GridView1.DataKeyNames = New String() {"IdCarga"}
                            gv.DataBind()

                            ''Vamos a Guardar en la Base

                            Dim fecha, fecha2, fecha3, fecnac, fecnacacompanante As String
                            'Dim fechaNacAdulto, fechaLlegada, fechaNacimiento As Date
                            Dim contador As Integer = 0
                            Dim banderallegada, banderafecnac, banderafecnacadulto As Integer
                            ConexionString = WebConfigurationManager.ConnectionStrings("SqlServices").ConnectionString
                            conexion = New SqlConnection(ConexionString)
                            conexion.Open()
                            For i = 0 To gv.Rows.Count - 1

                                'If IsDate(GridView1.Rows(i).Cells(20).Text) Then
                                '    fecha = GridView1.Rows(i).Cells(20).Text
                                '    fecha = fecha.Substring(6, 4) + fecha.Substring(3, 2) + fecha.Substring(0, 2)
                                'Else

                                '    fecha = ""

                                'End If

                                If IsDate(gv.Rows(i).Cells(4).Text) Then
                                    fecha2 = gv.Rows(i).Cells(4).Text
                                    fecha2 = fecha2.Substring(6, 4) + fecha2.Substring(3, 2) + fecha2.Substring(0, 2)
                                Else
                                    fecha2 = ""

                                End If

                                'If IsDate(GridView1.Rows(i).Cells(13).Text) Then
                                '    fecha3 = GridView1.Rows(i).Cells(13).Text
                                '    fecha3 = fecha3.Substring(6, 4) + fecha3.Substring(3, 2) + fecha3.Substring(0, 2)
                                'Else
                                '    fecha3 = ""

                                'End If

                                If gv.Rows(i).Cells(17).Text <> "&nbsp;" And gv.Rows(i).Cells(16).Text <> "&nbsp;" And gv.Rows(i).Cells(15).Text <> "&nsp;" Then
                                    fecnac = gv.Rows(i).Cells(17).Text + gv.Rows(i).Cells(16).Text + gv.Rows(i).Cells(15).Text
                                Else
                                    fecnac = ""
                                End If

                                If gv.Rows(i).Cells(28).Text <> "&nbsp;" And gv.Rows(i).Cells(27).Text <> "&nbsp" And gv.Rows(i).Cells(26).Text <> "&nbsp;" Then
                                    fecnacacompanante = gv.Rows(i).Cells(28).Text + gv.Rows(i).Cells(27).Text + gv.Rows(i).Cells(26).Text
                                Else
                                    fecnacacompanante = ""
                                End If




                                contador = i + 1
                                cmd = New SqlCommand("spInsertCarga", conexion)
                                cmd.CommandType = CommandType.StoredProcedure
                                cmd.Parameters.AddWithValue("@IdCarga", contador) 'GridView1.Rows(i).Cells(0).Text)
                                cmd.Parameters.AddWithValue("@Anio", IIf(gv.Rows(i).Cells(1).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(1).Text))
                                cmd.Parameters.AddWithValue("@Mes", IIf(gv.Rows(i).Cells(2).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(2).Text))
                                cmd.Parameters.AddWithValue("@Semana", IIf(gv.Rows(i).Cells(3).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(3).Text))
                                cmd.Parameters.AddWithValue("@FechaLlegada", IIf(fecha2 <> "", fecha2, DBNull.Value)) 'IIf(IsDate(fecha2), fecha2, DBNull.Value)) '.ToString("dd/MM/yyyy")
                                cmd.Parameters.AddWithValue("@LugarLlegada", IIf(gv.Rows(i).Cells(5).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(5).Text))
                                cmd.Parameters.AddWithValue("@PaisProcedencia", IIf(gv.Rows(i).Cells(6).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(6).Text))
                                cmd.Parameters.AddWithValue("@Estado", IIf(gv.Rows(i).Cells(7).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(7).Text))
                                cmd.Parameters.AddWithValue("@OficinaConsular", IIf(gv.Rows(i).Cells(8).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(8).Text))
                                cmd.Parameters.AddWithValue("@ViaRetorno", IIf(gv.Rows(i).Cells(9).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(9).Text))
                                cmd.Parameters.AddWithValue("@TipoDeportacion", IIf(gv.Rows(i).Cells(10).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(10).Text))
                                cmd.Parameters.AddWithValue("@NombreCompleto", IIf(gv.Rows(i).Cells(11).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(11).Text))
                                cmd.Parameters.AddWithValue("@NumIdentidad1", IIf(gv.Rows(i).Cells(12).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(12).Text))
                                cmd.Parameters.AddWithValue("@NumIdentidad2", IIf(gv.Rows(i).Cells(13).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(13).Text))
                                cmd.Parameters.AddWithValue("@NumIdentidad3", IIf(gv.Rows(i).Cells(14).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(14).Text))
                                cmd.Parameters.AddWithValue("@DiaNacimiento", IIf(gv.Rows(i).Cells(15).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(15).Text))
                                cmd.Parameters.AddWithValue("@MesNacimiento", IIf(gv.Rows(i).Cells(16).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(16).Text))
                                cmd.Parameters.AddWithValue("@AnioNacimiento", IIf(gv.Rows(i).Cells(17).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(17).Text))
                                cmd.Parameters.AddWithValue("@FechaNacimiento", IIf(fecnac <> "", fecnac, DBNull.Value)) 'IIf(IsDate(fecha3), fecha3, DBNull.Value))
                                cmd.Parameters.AddWithValue("@Sexo", IIf(gv.Rows(i).Cells(18).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(18).Text))
                                cmd.Parameters.AddWithValue("@ViajaSoloAcompaniado", IIf(gv.Rows(i).Cells(19).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(19).Text))
                                cmd.Parameters.AddWithValue("@NumeroPersonasAcompanian", IIf(gv.Rows(i).Cells(20).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(20).Text))
                                cmd.Parameters.AddWithValue("@Parentesco", IIf(gv.Rows(i).Cells(21).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(21).Text))
                                cmd.Parameters.AddWithValue("@NombreAcompanante", IIf(gv.Rows(i).Cells(22).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(22).Text))
                                cmd.Parameters.AddWithValue("@NumIdentidadAcompanante1", IIf(gv.Rows(i).Cells(23).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(23).Text))
                                cmd.Parameters.AddWithValue("@NumIdentidadAcompanante2", IIf(gv.Rows(i).Cells(24).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(24).Text))
                                cmd.Parameters.AddWithValue("@NumIdentidadAcompanante3", IIf(gv.Rows(i).Cells(25).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(25).Text))
                                cmd.Parameters.AddWithValue("@DiaNacimientoAcompanante", IIf(gv.Rows(i).Cells(26).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(26).Text))
                                cmd.Parameters.AddWithValue("@MesNacimientoAcompanante", IIf(gv.Rows(i).Cells(27).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(27).Text))
                                cmd.Parameters.AddWithValue("@AnioNacimientoAcompanante", IIf(gv.Rows(i).Cells(28).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(28).Text))
                                cmd.Parameters.AddWithValue("@FechaNacimientoAcompanante", IIf(fecnacacompanante <> "", fecnacacompanante, DBNull.Value)) 'IIf(IsDate(fecha), fecha, DBNull.Value)) 'IIf(IsDate(fecha), fecha, DBNull.Value))
                                cmd.Parameters.AddWithValue("@SexoAcompanante", IIf(gv.Rows(i).Cells(29).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(29).Text))
                                cmd.Parameters.AddWithValue("@Delito", IIf(gv.Rows(i).Cells(30).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(30).Text))
                                cmd.Parameters.AddWithValue("@CondicionMedica", IIf(gv.Rows(i).Cells(31).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(31).Text))
                                cmd.CommandTimeout = 50000
                                'cmd.ExecuteReader()
                                cmd.ExecuteNonQuery()
                            Next
                            Dim str As String
                            str = "SELECT [Idcarga] as Id ,[Anio] as 'Año',[Mes],[Semana],[FechaLlegada] as 'Fecha Llegada',[LugarLlegada] as 'Lugar Llegada'" &
                                       ",[PaisProcedencia] as 'Pais Procedencia',[Estado],[OficinaConsular] as 'Oficina Consular',[ViaRetorno] as 'Via Retorno'" &
                                       ",[TipoDeportacion] as 'Tipo Deportacion',[NombreCompleto] as 'Nombre Completo',[NumIdentidad1],[NumIdentidad2],[NumIdentidad3]" &
                                       ",[DiaNacimiento] as 'Dia Nacimiento',[MesNacimiento] as 'Mes Nacimiento',[AnioNacimiento] as 'Año Nacimiento',[Sexo],[ViajaSoloAcompaniado] as 'Viaja Solo o Acompañado'" &
                                       ",[NumeroPersonasAcompanian] as 'Numero de Personas que Acompañan',[Parentesco],[NombreAcompanante] as 'Nombre Acompañante'" &
                                       ",[NumIdentidadAcompanante1],[NumIdentidadAcompanante2],[NumIdentidadAcompanante3],[DiaNacimientoAcompanante] as 'Dia Nacimiento Acompañante'" &
                                       ",[MesNacimientoAcompanante] as 'Mes Nacimiento Acompañante',[AnioNacimientoAcompanante] as 'Año Nacimiento Acompañante',[SexoAcompanante] as 'Sexo Acompañante',[Delito],[CondicionMedica] as 'Condicion Medica' FROM [Cargas]"

                            Adapter = New SqlDataAdapter(str, conexion)
                            Adapter.Fill(dataset, "Cargas")
                            GridView1.DataSource = dataset
                            GridView1.DataMember = "Cargas"
                            'GridView1.DataKeyNames = New String() {"Id"}
                            'gv.AllowPaging = "True"
                            GridView1.KeyFieldName = "Id"
                            GridView1.DataBind()
                            GridView1.Visible = True
                            lblCorrectos.Visible = True
                            txtcorrectos.Visible = True
                            lblErrores.Visible = True
                            txtErrores.Visible = True
                            btnValidar.Visible = True


                        Catch ex As Exception
                            MsgBox(ex.ToString)
                            ' MsgBox("Inserte un nombre valido de la Hoja que desea importar", MsgBoxStyle.Information, "Informacion")

                        Finally
                            conexion.Close()
                        End Try

                    Else
                        Label1.ForeColor = System.Drawing.Color.Red
                        Label1.Text = "Archivo Invalido. Por favor cargue un archivo con las extensiones .xls o .xlsx"
                    End If


                End If


            End If
        Else

        End If
    End Sub
    'Public Sub cargardatos(ByVal nombrehojas As String, Filename As String, extension As String, rutaOrigen As String, uploadfile As String)
    '    If txtNombreHoja.Text <> "" Then

    '        'Cargamos el Archivo Temporalmete'
    '        ' If FileUpload1.HasFile Then
    '        'Dim FecCarga As Date = Now()
    '        'Dim uploadFolder As String = MapPath(ConfigurationManager.AppSettings.Get("DirCargaFuentesExternas")) & Format(FecCarga, "yyyyMMddHHmmss")
    '        'Dim FileName As String = FileUpload1.FileName
    '        'FileUpload1.SaveAs(uploadFolder & Filename)

    '        'Obtenemos el archivo cargado
    '        'Dim uploadFile As String = MapPath(ConfigurationManager.AppSettings.Get("DirCargaFuentesExternas")) & Format(FecCarga, "yyyyMMddHHmmss") & Filename

    '        If Filename.ToString <> "" Then
    '            'Dim rutaOrigen As String = Path.GetDirectoryName(FileUpload1.PostedFile.FileName)
    '            Dim ExcelFile As String = Filename.ToString 'FileUpload1.FileName.ToString
    '            'Dim extension As String = Path.GetExtension(ExcelFile)
    '            Dim xSheet As String = ""
    '            Dim ds As New DataSet
    '            Dim da As OleDbDataAdapter
    '            Dim dt As DataTable
    '            Dim conn As OleDbConnection
    '            Dim cadena, connbase As String

    '            If extension = ".xls" Or extension = ".xlsx" Then
    '                connbase = ""

    '                xSheet = txtNombreHoja.Text 'InputBox("Digite el nombre de la Hoja que desea importar", "Complete")

    '                'If extension = ".xls" Then
    '                '    'connbase = "Provider=Microsoft.Jet.OLEDB.4.0;Data source='{0}'; Extended Properties='Excel 8.0; HDR=Yes; IMEX=2;';"
    '                '    connbase = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source='{0}';Extended Properties='Excel 12.0;HDR=Yes;IMEX=1;';"
    '                '    'conn = New OleDbConnection("Provider = Microsoft.Jet.OLEDB.4.0; Data Source='" & ExcelFile & " '; " & "';Extended Properties=Excel 8.0;")
    '                'ElseIf extension = ".xlsx" Then
    '                '    connbase = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source='{0}';Extended Properties='Excel 12.0;HDR=Yes;IMEX=1;';"
    '                '    ' connbase = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source='{0}'; Jet OLEDB:Database Extended Properties='Excel 12.0; HDR=Yes; IMEX=2;';"
    '                '    'conn = New OleDbConnection(
    '                '    '          "Provider=Microsoft.ACE.OLEDB.12.0;" &
    '                '    '          "data source=" & ExcelFile & "; " &
    '                '    '         "Extended Properties='Excel 12.0 Xml;HDR=Yes'")
    '                'End If

    '                connbase = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source='{0}';Extended Properties='Excel 12.0;HDR=Yes;IMEX=1;';"

    '                Try

    '                    Dim connectionString As String = String.Format(connbase, uploadfile)
    '                    conn = New OleDbConnection(connectionString)
    '                    'da = New OleDbDataAdapter("SELECT * FROM  [" & xSheet & "$]", conn)
    '                    cadena = "Select * From [" & xSheet & "$]"

    '                    da = New System.Data.OleDb.OleDbDataAdapter(cadena, connectionString)
    '                    conn.Open()
    '                    da.Fill(ds, "MyData")
    '                    dt = ds.Tables("MyData")
    '                    gv.DataSource = ds
    '                    gv.DataMember = "MyData"
    '                    ' GridView1.DataKeyNames = New String() {"IdCarga"}
    '                    gv.DataBind()

    '                    ''Vamos a Guardar en la Base

    '                    Dim fecha, fecha2, fecha3, fecnac, fecnacacompanante As String
    '                    'Dim fechaNacAdulto, fechaLlegada, fechaNacimiento As Date
    '                    Dim contador As Integer = 0
    '                    Dim banderallegada, banderafecnac, banderafecnacadulto As Integer
    '                    ConexionString = WebConfigurationManager.ConnectionStrings("SqlServices").ConnectionString
    '                    conexion = New SqlConnection(ConexionString)
    '                    conexion.Open()
    '                    For i = 0 To gv.Rows.Count - 1

    '                        'If IsDate(GridView1.Rows(i).Cells(20).Text) Then
    '                        '    fecha = GridView1.Rows(i).Cells(20).Text
    '                        '    fecha = fecha.Substring(6, 4) + fecha.Substring(3, 2) + fecha.Substring(0, 2)
    '                        'Else

    '                        '    fecha = ""

    '                        'End If

    '                        If IsDate(gv.Rows(i).Cells(4).Text) Then
    '                            fecha2 = gv.Rows(i).Cells(4).Text
    '                            fecha2 = fecha2.Substring(6, 4) + fecha2.Substring(3, 2) + fecha2.Substring(0, 2)
    '                        Else
    '                            fecha2 = ""

    '                        End If

    '                        'If IsDate(GridView1.Rows(i).Cells(13).Text) Then
    '                        '    fecha3 = GridView1.Rows(i).Cells(13).Text
    '                        '    fecha3 = fecha3.Substring(6, 4) + fecha3.Substring(3, 2) + fecha3.Substring(0, 2)
    '                        'Else
    '                        '    fecha3 = ""

    '                        'End If

    '                        If gv.Rows(i).Cells(17).Text <> "&nbsp;" And gv.Rows(i).Cells(16).Text <> "&nbsp;" And gv.Rows(i).Cells(15).Text <> "&nsp;" Then
    '                            fecnac = gv.Rows(i).Cells(17).Text + gv.Rows(i).Cells(16).Text + gv.Rows(i).Cells(15).Text
    '                        Else
    '                            fecnac = ""
    '                        End If

    '                        If gv.Rows(i).Cells(28).Text <> "&nbsp;" And gv.Rows(i).Cells(27).Text <> "&nbsp" And gv.Rows(i).Cells(26).Text <> "&nbsp;" Then
    '                            fecnacacompanante = gv.Rows(i).Cells(28).Text + gv.Rows(i).Cells(27).Text + gv.Rows(i).Cells(26).Text
    '                        Else
    '                            fecnacacompanante = ""
    '                        End If




    '                        contador = i + 1
    '                        cmd = New SqlCommand("spInsertCarga", conexion)
    '                        cmd.CommandType = CommandType.StoredProcedure
    '                        cmd.Parameters.AddWithValue("@IdCarga", contador) 'GridView1.Rows(i).Cells(0).Text)
    '                        cmd.Parameters.AddWithValue("@Anio", IIf(gv.Rows(i).Cells(1).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(1).Text))
    '                        cmd.Parameters.AddWithValue("@Mes", IIf(gv.Rows(i).Cells(2).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(2).Text))
    '                        cmd.Parameters.AddWithValue("@Semana", IIf(gv.Rows(i).Cells(3).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(3).Text))
    '                        cmd.Parameters.AddWithValue("@FechaLlegada", IIf(fecha2 <> "", fecha2, DBNull.Value)) 'IIf(IsDate(fecha2), fecha2, DBNull.Value)) '.ToString("dd/MM/yyyy")
    '                        cmd.Parameters.AddWithValue("@LugarLlegada", IIf(gv.Rows(i).Cells(5).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(5).Text))
    '                        cmd.Parameters.AddWithValue("@PaisProcedencia", IIf(gv.Rows(i).Cells(6).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(6).Text))
    '                        cmd.Parameters.AddWithValue("@Estado", IIf(gv.Rows(i).Cells(7).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(7).Text))
    '                        cmd.Parameters.AddWithValue("@OficinaConsular", IIf(gv.Rows(i).Cells(8).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(8).Text))
    '                        cmd.Parameters.AddWithValue("@ViaRetorno", IIf(gv.Rows(i).Cells(9).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(9).Text))
    '                        cmd.Parameters.AddWithValue("@TipoDeportacion", IIf(gv.Rows(i).Cells(10).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(10).Text))
    '                        cmd.Parameters.AddWithValue("@NombreCompleto", IIf(gv.Rows(i).Cells(11).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(11).Text))
    '                        cmd.Parameters.AddWithValue("@NumIdentidad1", IIf(gv.Rows(i).Cells(12).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(12).Text))
    '                        cmd.Parameters.AddWithValue("@NumIdentidad2", IIf(gv.Rows(i).Cells(13).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(13).Text))
    '                        cmd.Parameters.AddWithValue("@NumIdentidad3", IIf(gv.Rows(i).Cells(14).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(14).Text))
    '                        cmd.Parameters.AddWithValue("@DiaNacimiento", IIf(gv.Rows(i).Cells(15).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(15).Text))
    '                        cmd.Parameters.AddWithValue("@MesNacimiento", IIf(gv.Rows(i).Cells(16).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(16).Text))
    '                        cmd.Parameters.AddWithValue("@AnioNacimiento", IIf(gv.Rows(i).Cells(17).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(17).Text))
    '                        cmd.Parameters.AddWithValue("@FechaNacimiento", IIf(fecnac <> "", fecnac, DBNull.Value)) 'IIf(IsDate(fecha3), fecha3, DBNull.Value))
    '                        cmd.Parameters.AddWithValue("@Sexo", IIf(gv.Rows(i).Cells(18).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(18).Text))
    '                        cmd.Parameters.AddWithValue("@ViajaSoloAcompaniado", IIf(gv.Rows(i).Cells(19).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(19).Text))
    '                        cmd.Parameters.AddWithValue("@NumeroPersonasAcompanian", IIf(gv.Rows(i).Cells(20).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(20).Text))
    '                        cmd.Parameters.AddWithValue("@Parentesco", IIf(gv.Rows(i).Cells(21).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(21).Text))
    '                        cmd.Parameters.AddWithValue("@NombreAcompanante", IIf(gv.Rows(i).Cells(22).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(22).Text))
    '                        cmd.Parameters.AddWithValue("@NumIdentidadAcompanante1", IIf(gv.Rows(i).Cells(23).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(23).Text))
    '                        cmd.Parameters.AddWithValue("@NumIdentidadAcompanante2", IIf(gv.Rows(i).Cells(24).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(24).Text))
    '                        cmd.Parameters.AddWithValue("@NumIdentidadAcompanante3", IIf(gv.Rows(i).Cells(25).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(25).Text))
    '                        cmd.Parameters.AddWithValue("@DiaNacimientoAcompanante", IIf(gv.Rows(i).Cells(26).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(26).Text))
    '                        cmd.Parameters.AddWithValue("@MesNacimientoAcompanante", IIf(gv.Rows(i).Cells(27).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(27).Text))
    '                        cmd.Parameters.AddWithValue("@AnioNacimientoAcompanante", IIf(gv.Rows(i).Cells(28).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(28).Text))
    '                        cmd.Parameters.AddWithValue("@FechaNacimientoAcompanante", IIf(fecnacacompanante <> "", fecnacacompanante, DBNull.Value)) 'IIf(IsDate(fecha), fecha, DBNull.Value)) 'IIf(IsDate(fecha), fecha, DBNull.Value))
    '                        cmd.Parameters.AddWithValue("@SexoAcompanante", IIf(gv.Rows(i).Cells(29).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(29).Text))
    '                        cmd.Parameters.AddWithValue("@Delito", IIf(gv.Rows(i).Cells(30).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(30).Text))
    '                        cmd.Parameters.AddWithValue("@CondicionMedica", IIf(gv.Rows(i).Cells(31).Text = "&nbsp;", DBNull.Value, gv.Rows(i).Cells(31).Text))
    '                        cmd.CommandTimeout = 50000
    '                        'cmd.ExecuteReader()
    '                        cmd.ExecuteNonQuery()
    '                    Next
    '                    Dim str As String
    '                    str = "SELECT [Idcarga] as Id ,[Anio] as 'Año',[Mes],[Semana],[FechaLlegada] as 'Fecha Llegada',[LugarLlegada] as 'Lugar Llegada'" &
    '                               ",[PaisProcedencia] as 'Pais Procedencia',[Estado],[OficinaConsular] as 'Oficina Consular',[ViaRetorno] as 'Via Retorno'" &
    '                               ",[TipoDeportacion] as 'Tipo Deportacion',[NombreCompleto] as 'Nombre Completo',[NumIdentidad1],[NumIdentidad2],[NumIdentidad3]" &
    '                               ",[DiaNacimiento] as 'Dia Nacimiento',[MesNacimiento] as 'Mes Nacimiento',[AnioNacimiento] as 'Año Nacimiento',[Sexo],[ViajaSoloAcompaniado] as 'Viaja Solo o Acompañado'" &
    '                               ",[NumeroPersonasAcompanian] as 'Numero de Personas que Acompañan',[Parentesco],[NombreAcompanante] as 'Nombre Acompañante'" &
    '                               ",[NumIdentidadAcompanante1],[NumIdentidadAcompanante2],[NumIdentidadAcompanante3],[DiaNacimientoAcompanante] as 'Dia Nacimiento Acompañante'" &
    '                               ",[MesNacimientoAcompanante] as 'Mes Nacimiento Acompañante',[AnioNacimientoAcompanante] as 'Año Nacimiento Acompañante',[SexoAcompanante] as 'Sexo Acompañante',[Delito],[CondicionMedica] as 'Condicion Medica' FROM [Cargas]"

    '                    Adapter = New SqlDataAdapter(str, conexion)
    '                    Adapter.Fill(dataset, "Cargas")
    '                    GridView1.DataSource = dataset
    '                    GridView1.DataMember = "Cargas"
    '                    'GridView1.DataKeyNames = New String() {"Id"}
    '                    'gv.AllowPaging = "True"
    '                    GridView1.KeyFieldName = "Id"
    '                    GridView1.DataBind()
    '                    lblCorrectos.Visible = True
    '                    txtcorrectos.Visible = True
    '                    lblErrores.Visible = True
    '                    txtErrores.Visible = True
    '                    btnValidar.Visible = True


    '                Catch ex As Exception
    '                    MsgBox(ex.ToString)
    '                    ' MsgBox("Inserte un nombre valido de la Hoja que desea importar", MsgBoxStyle.Information, "Informacion")

    '                Finally
    '                    conexion.Close()
    '                End Try

    '            Else
    '                Label1.ForeColor = System.Drawing.Color.Red
    '                Label1.Text = "Archivo Invalido. Por favor cargue un archivo con las extensiones .xls o .xlsx"
    '            End If


    '        End If


    '        ' End If
    '    Else

    '    End If
    'End Sub

    Protected Sub btnimportar_Click(sender As Object, e As EventArgs) Handles btnImportar.Click

        Try


            cargardatos(txtNombreHoja.Text)
            Image1.Visible = False
            Dim fichero As System.Web.HttpPostedFile
            fichero = FileUpload1.PostedFile
            FileUpload1.ForeColor = System.Drawing.Color.Transparent
            'style="color: transparent"
            Dim nombreArchivo As String = FileUpload1.FileName
            lblArchivo.Text = "Se Cargo el Archivo " & nombreArchivo
            lblArchivo.Visible = True
        Catch ex As Exception

        Finally

        End Try

    End Sub


    Public Sub get_file_path()
        Dim file = FileUpload1.PostedFile
        Dim pathinput As String = FileUpload1.PostedFile.InputStream.ToString()
        MsgBox(pathinput)
    End Sub


    Protected Sub GridView1_RowDeleted(sender As Object, e As GridViewDeletedEventArgs)

    End Sub
    Protected Sub GridView1_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs)

    End Sub
    Protected Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs)

    End Sub
    Protected Sub GridView1_DataBound(sender As Object, e As EventArgs)

    End Sub
    Protected Sub PageDropDownList_SelectedIndexChanged(sender As Object, e As EventArgs)
        ' Recupera la fila.
        Dim pagerRow As GridViewRow = gv.BottomPagerRow
        ' Recupera el control DropDownList...
        Dim pageList As DropDownList = CType(pagerRow.Cells(0).FindControl("PageDropDownList"), DropDownList)
        ' Se Establece la propiedad PageIndex para visualizar la página seleccionada...
        gv.PageIndex = pageList.SelectedIndex
        'Quita el mensaje de información si lo hubiera...
    End Sub


    Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gv.PageIndex = e.NewPageIndex ' Este Metodo es Para Cambiar el Indice de la Pagina al tratar de avanzar y retroceder
        ConexionString = WebConfigurationManager.ConnectionStrings("SqlServices").ConnectionString
        conexion = New SqlConnection(ConexionString)
        conexion.Open()
        Dim str As String
        str = "SELECT [Idcarga] as Id ,[Anio] as 'Año',[Mes],[Semana],[FechaLlegada] as 'Fecha Llegada',[LugarLlegada] as 'Lugar Llegada'" &
                               ",[PaisProcedencia] as 'Pais Procedencia',[Estado],[OficinaConsular] as 'Oficina Consular',[ViaRetorno] as 'Via Retorno'" &
                               ",[TipoDeportacion] as 'Tipo Deportacion',[NombreCompleto] as 'Nombre Completo',[NumIdentidad1],[NumIdentidad2],[NumIdentidad3]" &
                               ",[DiaNacimiento] as 'Dia Nacimiento',[MesNacimiento] as 'Mes Nacimiento',[AnioNacimiento] as 'Año Nacimiento',[Sexo],[ViajaSoloAcompaniado] as 'Viaja Solo o Acompañado'" &
                               ",[NumeroPersonasAcompanian] as 'Numero de Personas que Acompañan',[Parentesco],[NombreAcompanante] as 'Nombre Acompañante'" &
                               ",[NumIdentidadAcompanante1],[NumIdentidadAcompanante2],[NumIdentidadAcompanante3],[DiaNacimientoAcompanante] as 'Dia Nacimiento Acompañante'" &
                               ",[MesNacimientoAcompanante] as 'Mes Nacimiento Acompañante',[AnioNacimientoAcompanante] as 'Año Nacimiento Acompañante',[SexoAcompanante] as 'Sexo Acompañante',[Delito],[CondicionMedica] as 'Condicion Medica' FROM [Cargas]"
        Adapter = New SqlDataAdapter(str, conexion)
        Adapter.Fill(dataset, "Cargas")
        gv.DataSource = dataset
        gv.DataMember = "Cargas"
        gv.DataKeyNames = New String() {"Id"}
        gv.DataBind()



    End Sub

    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gv.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then

            e.Row.Cells(4).Text = String.Format("{0:dd-MM-yyyy}", CDate(e.Row.Cells(4).Text))


        End If
    End Sub
    Protected Sub btnValidar_Click(sender As Object, e As EventArgs) Handles btnValidar.Click
        Try
            ConexionString = WebConfigurationManager.ConnectionStrings("SqlServices").ConnectionString
            conexion = New SqlConnection(ConexionString)
            conexion.Open()
            cmd = New SqlCommand("spValidarCarga", conexion)
            cmd.CommandType = CommandType.StoredProcedure

            cmd.ExecuteNonQuery()


            Dim str As String
            str = "Select count(distinct idcarga) as total from errores"
            Adapter = New SqlDataAdapter(str, conexion)
            Adapter.Fill(dataset, "errores")

            If dataset.Tables(0).Rows.Count > 0 Then
                txtErrores.Text = dataset.Tables(0).Rows(0).Item("Total")
            End If

            dataset = New DataSet
            str = "select count(*) as Total from Cargas where idcarga not in (select idcarga from errores)"
            Adapter = New SqlDataAdapter(str, conexion)
            Adapter.Fill(dataset, "Cargas")

            If dataset.Tables(0).Rows.Count > 0 Then
                txtcorrectos.Text = dataset.Tables(0).Rows(0).Item("Total")
            End If

            conexion.Close()
            If txtcorrectos.Text <> "0" Then
                btnSubirArchivo.Visible = True
            End If

            lnkbCorrectos.Visible = True
            lnkbCorrectos.OnClientClick = "javascript:AbrirVentana('GridCorrectos.aspx')"
            lnkbErrores.Visible = True
            lnkbErrores.OnClientClick = "javascript:AbrirVentana('GridErroneos.aspx');"
        Catch ex As Exception

        Finally
            conexion.Close()
        End Try
    End Sub
    Protected Sub btnimportar_Click1(sender As Object, e As EventArgs)
        Dim validFileTypes As String() = {"xlsx", "xls"}
        Dim ext As String = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName)

        Dim isValidFile As Boolean = False
        For i As Integer = 0 To validFileTypes.Length - 1
            If ext = "." & validFileTypes(i) Then
                isValidFile = True
                Exit For
            End If
        Next
        If Not isValidFile Then
            Label1.ForeColor = System.Drawing.Color.Red
            Label1.Text = "Archivo Invalido. Por favor cargue un archivo con las extensiones " &
                          String.Join(",", validFileTypes)
        Else
            Label1.ForeColor = System.Drawing.Color.Green
            Label1.Text = "Archivo Cargado con Exito."
        End If
    End Sub

    Protected Sub btnSubirArchivo_Click(sender As Object, e As EventArgs) Handles btnSubirArchivo.Click
        Try
            Dim userName As String = HttpContext.Current.User.Identity.GetUserName

            ConexionString = WebConfigurationManager.ConnectionStrings("SqlServices").ConnectionString
            conexion = New SqlConnection(ConexionString)
            conexion.Open()
            cmd = New SqlCommand("spInsertarRegistros", conexion)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@IdUser", userName)
            cmd.ExecuteNonQuery()

            Dim str As String
            str = "select count(*) as Total from Registros r where exists (select * from Cargas c where r.NumIdentidadCompleto=c.NumeroIdentidad) and convert(nvarchar(10),FechaIngreso,110) =convert(nvarchar(10),getdate(),110)"
            Adapter = New SqlDataAdapter(str, conexion)
            Adapter.Fill(dataset, "Registros")

            If dataset.Tables(0).Rows.Count > 0 Then
                txtCargados.Text = dataset.Tables(0).Rows(0).Item("Total")
                lblDetalle.Visible = True
                lblCargados.Visible = True
                txtCargados.Visible = True
                lblcarga.Visible = True
            End If

        Catch ex As Exception

        End Try
    End Sub



    'Private Sub ASPxUploadControl1_FileUploadComplete(sender As Object, e As FileUploadCompleteEventArgs) Handles ASPxUploadControl1.FileUploadComplete
    '    Dim validFileTypes As String() = {"xlsx", "xls"}
    '    Dim ext As String = System.IO.Path.GetExtension(e.UploadedFile.FileName)

    '    Dim isValidFile As Boolean = False
    '    For i As Integer = 0 To validFileTypes.Length - 1
    '        If ext = "." & validFileTypes(i) Then
    '            isValidFile = True
    '            Exit For
    '        End If
    '    Next
    '    If Not isValidFile Then
    '        Label1.ForeColor = System.Drawing.Color.Red
    '        Label1.Text = "Archivo Invalido. Por favor cargue un archivo con las extensiones " &
    '                      String.Join(",", validFileTypes)
    '    Else
    '        Label1.ForeColor = System.Drawing.Color.Green
    '        Label1.Text = "Archivo Cargado con Exito."

    '        'Borrar contenido de Carpeta temporal
    '        Dim uploadFolder2 As String = MapPath(ConfigurationManager.AppSettings.Get("DirBorrar"))
    '        Dim ficherosCarpeta As String() = System.IO.Directory.GetFiles(uploadFolder2)
    '        For Each ficheroActual As String In ficherosCarpeta
    '            File.Delete(ficheroActual)
    '        Next

    '        Dim FecCarga As Date = Now()
    '        Dim uploadFolder As String = MapPath(ConfigurationManager.AppSettings.Get("DirCargaFuentesExternas")) & Format(FecCarga, "yyyyMMddHHmmss")
    '        Dim FileName As String = e.UploadedFile.FileName
    '        e.UploadedFile.SaveAs(uploadFolder & FileName)
    '        Dim rutaOrigen As String = uploadFolder & FileName 'Path.GetDirectoryName(e.UploadedFile.FileName)
    '        Dim uploadFile As String = MapPath(ConfigurationManager.AppSettings.Get("DirCargaFuentesExternas")) & Format(FecCarga, "yyyyMMddHHmmss") & FileName
    '        e.CallbackData = FileName



    '        Try
    '            ConexionString = WebConfigurationManager.ConnectionStrings("SqlServices").ConnectionString
    '            conexion = New SqlConnection(ConexionString)
    '            conexion.Open()
    '            cmd = New SqlCommand("Delete from Cargas", conexion)
    '            cmd.CommandType = CommandType.Text
    '            cmd.ExecuteNonQuery()
    '            conexion.Close()

    '            'Borra Errores
    '            conexion.Open()
    '            cmd = New SqlCommand("Delete from Errores", conexion)
    '            cmd.CommandType = CommandType.Text
    '            cmd.ExecuteNonQuery()
    '            conexion.Close()

    '            cargardatos(txtNombreHoja.Text, FileName, ext, rutaOrigen, uploadFile)
    '        Catch ex As Exception
    '            MsgBox(ex.Message)
    '        Finally
    '            conexion.Close()
    '        End Try
    '    End If
    'End Sub


    Private Sub Carga_CargarExcel_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'Borrar contenido de Carpeta temporal
            Dim uploadFolder As String = MapPath(ConfigurationManager.AppSettings.Get("DirBorrar"))
            Dim ficherosCarpeta As String() = System.IO.Directory.GetFiles(uploadFolder)

            For Each ficheroActual As String In ficherosCarpeta
                'Dim fs As New System.IO.FileStream(ficheroActual, FileMode.OpenOrCreate)
                'fs.Close()
                File.Delete(ficheroActual)
            Next

            Try
                ConexionString = WebConfigurationManager.ConnectionStrings("SqlServices").ConnectionString
                conexion = New SqlConnection(ConexionString)
                conexion.Open()
                cmd = New SqlCommand("Delete from Cargas", conexion)
                cmd.CommandType = CommandType.Text
                cmd.ExecuteNonQuery()
                conexion.Close()

                'Borra Errores
                conexion.Open()
                cmd = New SqlCommand("Delete from Errores", conexion)
                cmd.CommandType = CommandType.Text
                cmd.ExecuteNonQuery()
                conexion.Close()


            Catch ex As Exception
                MsgBox(ex.Message)
            Finally
                conexion.Close()
            End Try
        End If

    End Sub


End Class
