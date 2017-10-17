
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Partial Class Registro_RegistroDatos
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
    'Private Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
    '    txtFechaLlegada.Text = Calendar1.SelectedDate.ToShortDateString()
    '    Calendar1.Visible = False
    'End Sub

    Private Sub Calendar2_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar2.SelectionChanged
        txtFecNac.Text = Calendar2.SelectedDate.ToShortDateString()
        Calendar2.Visible = False
    End Sub

    Private Sub Calendar3_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar3.SelectionChanged
        txtFecNacAdulto.Text = Calendar3.SelectedDate.ToShortDateString()
        Calendar3.Visible = False
    End Sub

    'Private Sub ddlDepartamento_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlDepartamento.SelectedIndexChanged
    '    sqlMunicipios.DataBind()
    '    ddlMunicipio.DataBind()
    'End Sub

    Private Sub ibCalendario_Click(sender As Object, e As ImageClickEventArgs) Handles ibCalendario.Click
        'If (Calendar1.Visible) Then
        '    Calendar1.Visible = False
        'Else
        '    Calendar1.Visible = True
        'End If
    End Sub

    Private Sub ibCalendarioAdulto_Click(sender As Object, e As ImageClickEventArgs) Handles ibCalendarioAdulto.Click
        If (Calendar3.Visible) Then
            Calendar3.Visible = False
        Else
            Calendar3.Visible = True
        End If
    End Sub

    Private Sub ibCalendarioNac_Click(sender As Object, e As ImageClickEventArgs) Handles ibCalendarioNac.Click
        If (Calendar2.Visible) Then
            Calendar2.Visible = False
        Else
            Calendar2.Visible = True
        End If
    End Sub

    Private Sub Registro_RegistroDatos_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'Calendar1.Visible = False
            Calendar2.Visible = False
            Calendar3.Visible = False
        End If
    End Sub


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click

        Try
            conexion = New SqlConnection(cadenaConexion)
            conexion.Open()
            Adapter = New SqlDataAdapter("Select count(*) From Registros where numidentidadCompleto ='" & txtBusqueda.Text & "'", conexion)
            dataset = New DataSet
            Adapter.Fill(dataset, "Registros")

            If dataset.Tables(0).Rows.Count > -1 Then
                lblAdvertencia.Visible = True
                imgAdvertencia.Visible = True
                lnkbReincidentes.Visible = True
                lnkbReincidentes.OnClientClick = "javascript:AbrirVentana('RetornadosReincidentes.aspx?num=" & txtBusqueda.Text & "')"
            End If

        Catch ex As Exception

        Finally
            conexion.Close()

        End Try

    End Sub
End Class
