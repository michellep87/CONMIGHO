
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Partial Class Registro_RegistroMigrantes
    Inherits System.Web.UI.Page
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

    Private Sub CargarRegistros(ByVal id As Integer)
        conexion = New SqlConnection(cadenaConexion)
        conexion.Open()
        Adapter = New SqlDataAdapter("Select * From Registros where Id =" & id & "", conexion)
        dataset = New DataSet
        Adapter.Fill(dataset, "Registros")

        If dataset.Tables(0).Rows.Count > 0 Then
            With dataset.Tables(0).Rows(0)
                txtNumIdentidad.Text = IIf(Not IsDBNull(.Item("NumIdentidadCompleto")), .Item("NumIdentidadCompleto"), "")
                txtAnio.Value = IIf(Not IsDBNull(.Item("Año")), .Item("Año"), "")
                cboMeses.Value = IIf(Not IsDBNull(.Item("Mes").ToString()), .Item("Mes").ToString(), Nothing)
                cboMeses.DataBind()
                seSemana.Value = IIf(Not IsDBNull(.Item("Semana")), .Item("Semana"), "")
                deFechaLlegada.Value = IIf(Not IsDBNull(.Item("FechaLlegada")), .Item("FechaLlegada"), "")
                cboLugarLlegada.Value = IIf(Not IsDBNull(.Item("CodLugarLlegada").ToString()), .Item("CodLugarLlegada").ToString(), Nothing)
                cboLugarLlegada.DataBind()
                cboDiaLlegada.Value = IIf(Not IsDBNull(.Item("Dia").ToString()), .Item("Dia").ToString(), Nothing)
                cboDiaLlegada.DataBind()
                cboPais.Value = IIf(Not IsDBNull(.Item("CodPaisProcedencia").ToString()), .Item("CodPaisProcedencia").ToString(), Nothing)
                cboPais.DataBind()
                cboEstado.Value = IIf(Not IsDBNull(.Item("CodEstado").ToString()), .Item("CodEstado").ToString(), Nothing)
                cboOficinaConsular.Value = IIf(Not IsDBNull(.Item("CodOficinaConsular").ToString()), .Item("CodOficinaConsular").ToString(), Nothing)
                cboViaRetorno.Value = .Item("CodViaRetorno").ToString()
                cboViaRetorno.DataBind()
                cboTipoDeportacion.Value = IIf(Not IsDBNull(.Item("CodTipoDeportacion").ToString()), .Item("CodTipoDeportacion").ToString(), Nothing)
                cboTipoDeportacion.DataBind()
                txtNombre.Text = IIf(Not IsDBNull(.Item("NombreCompleto")), .Item("NombreCompleto"), "")
                cboDepartamento.Value = IIf(Not IsDBNull(.Item("CodDepartamento").ToString()), .Item("CodDepartamento").ToString(), Nothing)
                cboDepartamento.DataBind()
                cboMunicipio.Value = IIf(Not IsDBNull(.Item("CodMunicipio").ToString()), .Item("CodMunicipio").ToString(), Nothing)
                cboMunicipio.DataBind()
                deFechaNacimiento.Value = IIf(Not IsDBNull(.Item("FechaNacimiento")), .Item("FechaNacimiento"), Nothing)
                deFechaNacimiento.DataBind()
                seEdad.Value = IIf(Not IsDBNull(.Item("Edad")), .Item("Edad"), 0)

                'If seEdad.Value >= 18 Then
                '    rblAdulto.Value = "Adulto"
                'Else
                '    rblAdulto.Value = "NNA"
                'End If

                If Not IsDBNull(.Item("Adulto")) Then
                    If .Item("Adulto") = True Then
                        rblAdulto.Value = "Adulto"
                    Else
                        rblAdulto.Value = "NNA"
                    End If
                End If

                rblAdulto.Enabled = False

                If Not IsDBNull(.Item("CodGenero").ToString) Then
                    cboGenero.Value = .Item("CodGenero").ToString
                Else
                    cboGenero.Value = Nothing
                End If
                cboGenero.DataBind()

                If Not IsDBNull(.Item("ViajaSolo")) Then
                    If .Item("ViajaSolo") = 1 Then
                        cboViajaSolo.Value = "1"
                        pnlAcompanante.Enabled = False

                    Else
                        cboViajaSolo.Value = "2"
                        seUnidadFamiliar.Value = .Item("UnidadFamiliar").ToString()
                        seNumPersonanAcompanan.Value = .Item("NumPersonas").ToString()
                        cboParentesco.Value = .Item("CodParentesco").ToString()
                        cboParentesco.DataBind()
                        txtNombreAcompanante.Text = IIf(Not IsDBNull(.Item("NombreAdulto")), .Item("NombreAdulto"), "")
                        txtNumIdentidadAdulto.Text = .Item("IdentidadAdulto")
                        cboDepartamentoAdulto.Value = .Item("CodDepartamentoAdulto").ToString()
                        cboDepartamentoAdulto.DataBind()
                        cboMunicipioAdulto.Value = .Item("CodMunicipioAdulto").ToString()
                        cboMunicipioAdulto.DataBind()
                        deFechaNacimientoAdulto.Value = .Item("FechaNacimientoAdulto")
                        seEdadAdulto.Value = .Item("EdadAdulto")
                        cboGeneroAdulto.Value = .Item("CodGeneroAdulto").ToString()


                    End If
                Else
                    cboViajaSolo.Value = Nothing
                End If


                cboViajaSolo.DataBind()

                txtDelito.Text = IIf(Not IsDBNull(.Item("Delito").ToString()), .Item("Delito").ToString(), "")
                txtCondicionMedica.Text = IIf(Not IsDBNull(.Item("CondicionMedica").ToString()), .Item("CondicionMedica").ToString(), "")

                If Not IsDBNull(.Item("Habilitado")) Then

                    If .Item("Habilitado") = False Then
                        btnEliminar.Visible = False
                    Else
                        btnEliminar.Visible = True
                    End If
                End If
            End With
        End If
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Request.QueryString("Id") <> Nothing Then
                CargarRegistros(Request.QueryString("Id"))
                btnGuardar.Visible = False
            End If
        End If

    End Sub
    Protected Sub btnBuscar0_Click(sender As Object, e As EventArgs) Handles btnBuscar0.Click
        Try
            conexion = New SqlConnection(cadenaConexion)
            conexion.Open()
            Adapter = New SqlDataAdapter("Select * From Registros where numidentidadCompleto ='" & txtNumIdentidad.Text & "'", conexion)
        dataset = New DataSet
            Adapter.Fill(dataset, "Registros")

            If dataset.Tables(0).Rows.Count > 1 Then
                lblAdvertencia.Visible = True
                imgAdvertencia.Visible = True
                lnkbReincidentes.Visible = True
                lnkbReincidentes.OnClientClick = "javascript:AbrirVentana('RetornadosReincidentes.aspx?num=" & txtNumIdentidad.Text & "')"
            Else
                lblAdvertencia.Visible = False
                imgAdvertencia.Visible = False
                lnkbReincidentes.Visible = False
            End If

        Catch ex As Exception

        Finally
            conexion.Close()

        End Try

    End Sub

    Private Sub deFechaNacimiento_ValueChanged(sender As Object, e As EventArgs) Handles deFechaNacimiento.ValueChanged
        Dim dia, mes, anio, fecha As String

        dia = deFechaNacimiento.Date.Day
        mes = deFechaNacimiento.Date.Month
        anio = deFechaNacimiento.Date.Year
        If dia.Length = 1 Then
            dia = "0" + dia
        End If

        If mes.Length = 1 Then
            mes = "0" + mes
        End If

        fecha = anio + mes + dia


        Try

            conexion = New SqlConnection(cadenaConexion)
            conexion.Open()
            Adapter = New SqlDataAdapter("Select [dbo].[CalculaEdad]('" & fecha & "',GetDate())", conexion)
            dataset = New DataSet
            Adapter.Fill(dataset, "CalculaEdad")

            seEdad.Value = dataset.Tables(0).Rows(0)(0)

            If dataset.Tables(0).Rows(0)(0) >= 18 Then
                rblAdulto.Value = "Adulto"
            Else
                rblAdulto.Value = "NNA"
            End If
            rblAdulto.Enabled = False
        Catch ex As Exception

        Finally
            conexion.Close()

        End Try

    End Sub

    Private Sub cboViajaSolo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboViajaSolo.SelectedIndexChanged
        If cboViajaSolo.SelectedItem.Value = 1 Then

            pnlAcompanante.Enabled = False
        Else
            pnlAcompanante.Enabled = True
        End If
    End Sub

    Private Sub deFechaNacimientoAdulto_ValueChanged(sender As Object, e As EventArgs) Handles deFechaNacimientoAdulto.ValueChanged
        Dim dia, mes, anio, fecha As String

        dia = deFechaNacimientoAdulto.Date.Day
        mes = deFechaNacimientoAdulto.Date.Month
        anio = deFechaNacimientoAdulto.Date.Year
        If dia.Length = 1 Then
            dia = "0" + dia
        End If

        If mes.Length = 1 Then
            mes = "0" + mes
        End If

        fecha = anio + mes + dia

        Try

            conexion = New SqlConnection(cadenaConexion)
            conexion.Open()
            Adapter = New SqlDataAdapter("Select [dbo].[CalculaEdad]('" & fecha & "',GetDate())", conexion)
            dataset = New DataSet
            Adapter.Fill(dataset, "CalculaEdad")

            seEdadadulto.Value = dataset.Tables(0).Rows(0)(0)


        Catch ex As Exception

        Finally
            conexion.Close()

        End Try

    End Sub
    Protected Sub btnEditar_Click(sender As Object, e As EventArgs) Handles btnEditar.Click
        Try
            Dim userName As String = HttpContext.Current.User.Identity.GetUserName
            Dim dianac, mesnac, anionac, dianacadulto, mesnacadulto, anionacadulto, num1, num2, num3, numa1, numa2, numa3 As String
            Dim adulto, viajasolo As Boolean
            dianac = deFechaNacimiento.Date.Day
            mesnac = deFechaNacimiento.Date.Month
            anionac = deFechaNacimiento.Date.Year
            num1 = txtNumIdentidad.Text.Substring(0, 4)
            num2 = txtNumIdentidad.Text.Substring(4, 4)
            num3 = txtNumIdentidad.Text.Substring(8, 5)

            If seEdad.Value >= 18 Then
                adulto = True
            Else
                adulto = False
            End If

            If cboViajaSolo.Value = 2 Then
                viajasolo = True
            Else
                viajasolo = False
            End If

            If cboViajaSolo.Value = 2 Then
                dianacadulto = deFechaNacimientoAdulto.Date.Day
                mesnacadulto = deFechaNacimientoAdulto.Date.Month
                anionacadulto = deFechaNacimientoAdulto.Date.Year
                numa1 = txtNumIdentidadAdulto.Text.Substring(0, 4)
                numa2 = txtNumIdentidadAdulto.Text.Substring(4, 4)
                numa3 = txtNumIdentidadAdulto.Text.Substring(8, 5)

            End If

            ConexionString = WebConfigurationManager.ConnectionStrings("SqlServices").ConnectionString
            conexion = New SqlConnection(ConexionString)
            conexion.Open()

            cmd = New SqlCommand("spUpdateRegistros", conexion)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Id", Request.QueryString("Id"))
            cmd.Parameters.AddWithValue("@Año", txtAnio.Value)
            cmd.Parameters.AddWithValue("@Mes", cboMeses.Value)
            cmd.Parameters.AddWithValue("@Semana", seSemana.Value)
            cmd.Parameters.AddWithValue("@Dia", cboDiaLlegada.Value)
            cmd.Parameters.AddWithValue("@FechaLlegada", CDate(deFechaLlegada.Value))
            cmd.Parameters.AddWithValue("@CodLugarLlegada", cboLugarLlegada.Value)
            cmd.Parameters.AddWithValue("@CodPaisProcedencia", cboPais.Value)
            cmd.Parameters.AddWithValue("@CodEstado", IIf(cboEstado.Value <> Nothing, cboEstado.Value, DBNull.Value))
            cmd.Parameters.AddWithValue("@CodOficinaConsular", IIf(cboOficinaConsular.Value <> Nothing, cboOficinaConsular.Value, DBNull.Value))
            cmd.Parameters.AddWithValue("@CodViaRetorno", cboViaRetorno.Value)
            cmd.Parameters.AddWithValue("@CodTipoDeportacion", cboTipoDeportacion.Value)
            cmd.Parameters.AddWithValue("@NumIdentidad1", num1)
            cmd.Parameters.AddWithValue("@NumIdentidad2", num2)
            cmd.Parameters.AddWithValue("@NumIdentidad3", num3)
            cmd.Parameters.AddWithValue("@NombreCompleto", txtNombre.Text)
            cmd.Parameters.AddWithValue("@CodDepartamento", cboDepartamento.Value)
            cmd.Parameters.AddWithValue("@CodMunicipio", cboMunicipio.Value)
            cmd.Parameters.AddWithValue("@DiaNacimiento", dianac)
            cmd.Parameters.AddWithValue("@MesNacimiento", mesnac)
            cmd.Parameters.AddWithValue("@AnioNacimiento", anionac)
            cmd.Parameters.AddWithValue("@FechaNacimiento", CDate(deFechaNacimiento.Text))
            cmd.Parameters.AddWithValue("@Edad", seEdad.Value)
            cmd.Parameters.AddWithValue("@Adulto", adulto)
            cmd.Parameters.AddWithValue("@CodGenero", cboGenero.Value)
            cmd.Parameters.AddWithValue("@ViajaSolo", viajasolo)
            cmd.Parameters.AddWithValue("@UnidadFamiliar", seUnidadFamiliar.Value)
            cmd.Parameters.AddWithValue("@NumPersonas", seNumPersonanAcompanan.Value)
            cmd.Parameters.AddWithValue("@CodParentesco", IIf(cboViajaSolo.Value = 2, cboParentesco.Value, DBNull.Value))
            cmd.Parameters.AddWithValue("@NombreAdulto", txtNombreAcompanante.Text)
            cmd.Parameters.AddWithValue("@NumIdentidadAdulto1", IIf(cboViajaSolo.Value = 2, numa1, DBNull.Value))
            cmd.Parameters.AddWithValue("@NumIdentidadAdulto2", IIf(cboViajaSolo.Value = 2, numa2, DBNull.Value))
            cmd.Parameters.AddWithValue("@NumIdentidadAdulto3", IIf(cboViajaSolo.Value = 2, numa3, DBNull.Value))
            cmd.Parameters.AddWithValue("@CodDepartamentoAdulto", IIf(cboViajaSolo.Value = 2, cboDepartamentoAdulto.Value, DBNull.Value))
            cmd.Parameters.AddWithValue("@CodMunicipioAdulto", IIf(cboViajaSolo.Value = 2, cboMunicipioAdulto.Value, DBNull.Value))
            cmd.Parameters.AddWithValue("@DiaNacimientoAdulto", IIf(cboViajaSolo.Value = 2, dianacadulto, DBNull.Value))
            cmd.Parameters.AddWithValue("@MesNacimientoAdulto", IIf(cboViajaSolo.Value = 2, mesnacadulto, DBNull.Value))
            cmd.Parameters.AddWithValue("@AnioNacimientoAdulto", IIf(cboViajaSolo.Value = 2, anionacadulto, DBNull.Value))
            cmd.Parameters.AddWithValue("@FechaNacimientoAdulto", IIf(cboViajaSolo.Value = 2, CDate(deFechaNacimientoAdulto.Text), DBNull.Value))
            cmd.Parameters.AddWithValue("@EdadAdulto", IIf(cboViajaSolo.Value = 2, seEdadAdulto.Value, DBNull.Value))
            cmd.Parameters.AddWithValue("@CodGeneroAdulto", IIf(cboViajaSolo.Value = 2, cboGeneroAdulto.Value, DBNull.Value))
            cmd.Parameters.AddWithValue("@Delito", txtDelito.Text)
            cmd.Parameters.AddWithValue("@CondicionMedica", txtCondicionMedica.Text)
            cmd.Parameters.AddWithValue("@UsuarioIngresa", userName)
            cmd.CommandTimeout = 50000
            cmd.ExecuteNonQuery()

            lblAviso.Text = "Registro Actualizado Exitosamente!!!"
            lblAviso.ForeColor = System.Drawing.Color.Green
            lblAviso.Visible = True


        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            conexion.Close()
        End Try

    End Sub
    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Try
            Dim userName As String = HttpContext.Current.User.Identity.GetUserName
            Dim dianac, mesnac, anionac, dianacadulto, mesnacadulto, anionacadulto, num1, num2, num3, numa1, numa2, numa3 As String
            Dim adulto, viajasolo As Boolean
            dianac = deFechaNacimiento.Date.Day
            mesnac = deFechaNacimiento.Date.Month
            anionac = deFechaNacimiento.Date.Year
            num1 = txtNumIdentidad.Text.Substring(0, 4)
            num2 = txtNumIdentidad.Text.Substring(4, 4)
            num3 = txtNumIdentidad.Text.Substring(8, 5)

            If seEdad.Value >= 18 Then
                adulto = True
            Else
                adulto = False
            End If

            If cboViajaSolo.Value = 2 Then
                viajasolo = True
            Else
                viajasolo = False
            End If

            If cboViajaSolo.Value = 2 Then
                dianacadulto = deFechaNacimientoAdulto.Date.Day
                mesnacadulto = deFechaNacimientoAdulto.Date.Month
                anionacadulto = deFechaNacimientoAdulto.Date.Year
                numa1 = txtNumIdentidadAdulto.Text.Substring(0, 4)
                numa2 = txtNumIdentidadAdulto.Text.Substring(4, 4)
                numa3 = txtNumIdentidadAdulto.Text.Substring(8, 5)

            End If

            ConexionString = WebConfigurationManager.ConnectionStrings("SqlServices").ConnectionString
            conexion = New SqlConnection(ConexionString)
            conexion.Open()

            cmd = New SqlCommand("spInsertaFormularioRegistros", conexion)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Año", txtAnio.Value)
            cmd.Parameters.AddWithValue("@Mes", cboMeses.Value)
            cmd.Parameters.AddWithValue("@Semana", seSemana.Value)
            cmd.Parameters.AddWithValue("@Dia", cboDiaLlegada.Value)
            cmd.Parameters.AddWithValue("@FechaLlegada", CDate(deFechaLlegada.Text))
            cmd.Parameters.AddWithValue("@CodLugarLlegada", cboLugarLlegada.Value)
            cmd.Parameters.AddWithValue("@CodPaisProcedencia", cboPais.Value)
            cmd.Parameters.AddWithValue("@CodEstado", IIf(cboEstado.Value <> Nothing, cboEstado.Value, DBNull.Value))
            cmd.Parameters.AddWithValue("@CodOficinaConsular", IIf(cboOficinaConsular.Value <> Nothing, cboOficinaConsular.Value, DBNull.Value))
            cmd.Parameters.AddWithValue("@CodViaRetorno", cboViaRetorno.Value)
            cmd.Parameters.AddWithValue("@CodTipoDeportacion", cboTipoDeportacion.Value)
            cmd.Parameters.AddWithValue("@NumIdentidad1", num1)
            cmd.Parameters.AddWithValue("@NumIdentidad2", num2)
            cmd.Parameters.AddWithValue("@NumIdentidad3", num3)
            cmd.Parameters.AddWithValue("@NombreCompleto", txtNombre.Text)
            cmd.Parameters.AddWithValue("@CodDepartamento", cboDepartamento.Value)
            cmd.Parameters.AddWithValue("@CodMunicipio", cboMunicipio.Value)
            cmd.Parameters.AddWithValue("@DiaNacimiento", dianac)
            cmd.Parameters.AddWithValue("@MesNacimiento", mesnac)
            cmd.Parameters.AddWithValue("@AnioNacimiento", anionac)
            cmd.Parameters.AddWithValue("@FechaNacimiento", CDate(deFechaNacimiento.Value))
            cmd.Parameters.AddWithValue("@Edad", seEdad.Value)
            cmd.Parameters.AddWithValue("@Adulto", adulto)
            cmd.Parameters.AddWithValue("@CodGenero", cboGenero.Value)
            cmd.Parameters.AddWithValue("@ViajaSolo", viajasolo)
            cmd.Parameters.AddWithValue("@UnidadFamiliar", seUnidadFamiliar.Value)
            cmd.Parameters.AddWithValue("@NumPersonas", seNumPersonanAcompanan.Value)
            cmd.Parameters.AddWithValue("@CodParentesco", IIf(cboViajaSolo.Value = 2, cboParentesco.Value, DBNull.Value))
            cmd.Parameters.AddWithValue("@NombreAdulto", txtNombreAcompanante.Text)
            cmd.Parameters.AddWithValue("@NumIdentidadAdulto1", IIf(cboViajaSolo.Value = 2, numa1, DBNull.Value))
            cmd.Parameters.AddWithValue("@NumIdentidadAdulto2", IIf(cboViajaSolo.Value = 2, numa2, DBNull.Value))
            cmd.Parameters.AddWithValue("@NumIdentidadAdulto3", IIf(cboViajaSolo.Value = 2, numa3, DBNull.Value))
            cmd.Parameters.AddWithValue("@CodDepartamentoAdulto", IIf(cboViajaSolo.Value = 2, cboDepartamentoAdulto.Value, DBNull.Value))
            cmd.Parameters.AddWithValue("@CodMunicipioAdulto", IIf(cboViajaSolo.Value = 2, cboMunicipioAdulto.Value, DBNull.Value))
            cmd.Parameters.AddWithValue("@DiaNacimientoAdulto", IIf(cboViajaSolo.Value = 2, dianacadulto, DBNull.Value))
            cmd.Parameters.AddWithValue("@MesNacimientoAdulto", IIf(cboViajaSolo.Value = 2, mesnacadulto, DBNull.Value))
            cmd.Parameters.AddWithValue("@AnioNacimientoAdulto", IIf(cboViajaSolo.Value = 2, anionacadulto, DBNull.Value))
            cmd.Parameters.AddWithValue("@FechaNacimientoAdulto", IIf(cboViajaSolo.Value = 2, CDate(deFechaNacimientoAdulto.Value), DBNull.Value))
            cmd.Parameters.AddWithValue("@EdadAdulto", IIf(cboViajaSolo.Value = 2, seEdadAdulto.Value, DBNull.Value))
            cmd.Parameters.AddWithValue("@CodGeneroAdulto", IIf(cboViajaSolo.Value = 2, cboGeneroAdulto.Value, DBNull.Value))
            cmd.Parameters.AddWithValue("@Delito", txtDelito.Text)
            cmd.Parameters.AddWithValue("@CondicionMedica", txtCondicionMedica.Text)
            cmd.Parameters.AddWithValue("@UsuarioIngresa", userName)
            cmd.CommandTimeout = 50000
            cmd.ExecuteNonQuery()

            lblAviso.Text = "Registro Ingresado Exitosamente!!!"
            lblAviso.ForeColor = System.Drawing.Color.Pink
            lblAviso.Visible = True


        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            conexion.Close()
        End Try
    End Sub
    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs) Handles btnEliminar.Click
        ASPxPopupControl2.ShowOnPageLoad = True
    End Sub
    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        ASPxPopupControl2.ShowOnPageLoad = False
    End Sub
    Protected Sub btnAceptar_Click(sender As Object, e As EventArgs) Handles btnAceptar.Click
        Try
            Dim userName As String = HttpContext.Current.User.Identity.GetUserName
            conexion = New SqlConnection(cadenaConexion)
            conexion.Open()
            Dim cadena As String = "update Registros set Habilitado=0,UsuarioModifica='" & userName & "',FechaModifica=getdate() where id=" & Request.QueryString("Id")
            cmd = New SqlCommand(cadena, conexion)
            cmd.CommandType = CommandType.Text
            cmd.ExecuteNonQuery()


            ASPxPopupControl2.ShowOnPageLoad = False


        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            conexion.Close()

        End Try
    End Sub

    Private Sub deFechaLlegada_ValueChanged(sender As Object, e As EventArgs) Handles deFechaLlegada.ValueChanged
        Dim dia As Integer

        If deFechaLlegada.Value <> Nothing Then
            dia = Weekday(deFechaLlegada.Value)
            cboDiaLlegada.Value = dia.ToString()
            cboDiaLlegada.DataBind()
        Else
            cboDiaLlegada.SelectedIndex = -1
            cboDiaLlegada.DataBind()
        End If


    End Sub



End Class
