Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports DevExpress.Web.ASPxGridView
Imports Microsoft.VisualBasic

Imports DevExpress.Export
Imports DevExpress.XtraPrinting
Partial Class Carga_RegistrosCarga
    Inherits System.Web.UI.Page

    Public conexion As SqlConnection
    Public comando As SqlCommand
    Public objDataReader As SqlDataReader
    Public operacion As Integer
    Public totalItemSeleccionados As Integer = 0
    Public ConexionString As String
    Public Adapter As New SqlDataAdapter
    Public cmd As New SqlCommand
    Public dataset As New DataSet

    Public Sub CargarDatos()
        ' If IsPostBack Or IsCallback Then
        Try
                Dim anio, mes, semana As String



                If ddlAnio.Value <> Nothing Then
                    anio = ddlAnio.Value
                Else
                    anio = ""
                End If

                If ddlMes.Value <> Nothing Then
                    mes = ddlMes.Value
                Else
                    mes = ""
                End If

                If txtSemana.Text <> "0" Then
                    semana = txtSemana.Text
                Else
                    semana = ""
                End If

                'SqlDataSource1.SelectParameters(0).DefaultValue = anio
                'SqlDataSource1.SelectParameters(1).DefaultValue = mes
                'SqlDataSource1.SelectParameters(2).DefaultValue = semana
                'SqlDataSource1.DataBind()
                'gvRegistros.DataBind()


                ConexionString = WebConfigurationManager.ConnectionStrings("SqlServices").ConnectionString
                conexion = New SqlConnection(ConexionString)
                conexion.Open()
                cmd = New SqlCommand("spBuscarRegistros", conexion)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@Anio", anio)
                cmd.Parameters.AddWithValue("@Mes", mes)
                cmd.Parameters.AddWithValue("@Semana", semana)
                cmd.ExecuteNonQuery()
                Adapter = New SqlDataAdapter(cmd)
                'Adapter.SelectCommand = cmd
                dataset = New DataSet
                Adapter.Fill(dataset, "Registros")


                gvRegistrados.DataSource = dataset
                gvRegistrados.DataMember = "Registros"
                gvRegistrados.KeyFieldName = "Id"
                'gvRegistros.DataKeyNames = New String() {"Id"}
                'gvRegistros.AllowPaging = "True"
                gvRegistrados.DataBind()
                gvRegistrados.Visible = True
                btnExportarExcel.Visible = True
                'gveRegistrosCarga.GridViewID = "gvRegistrados"
                'gveRegistrosCarga.DataBind()


            Catch ex As Exception

            End Try
        ' End If

    End Sub
    Private Sub Carga_RegistrosCarga_Load(sender As Object, e As EventArgs) Handles Me.Load


        If Not IsPostBack Then
            Dim anio, limite As Integer

            anio = Now.Year
            limite = anio - 3
            While anio >= limite
                ddlAnio.Items.Add(anio)
                anio -= 1

            End While
        End If

        CargarDatos()


    End Sub
    Protected Sub gvRegistros_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)

    End Sub
    Protected Sub btnGenear_Click(sender As Object, e As EventArgs) Handles btnGenear.Click

        CargarDatos()


    End Sub

    'Private Sub gvRegistros_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvRegistros.RowDataBound
    '    Try
    '        If (e.Row.RowType = DataControlRowType.DataRow) Then
    '            If e.Row.Cells(5).Text <> "&nbsp;" Then
    '                e.Row.Cells(5).Text = String.Format("{0:dd-MM-yyyy}", CDate(e.Row.Cells(5).Text))
    '            End If

    '            If e.Row.Cells(16).Text <> "&nbsp;" Then
    '                e.Row.Cells(16).Text = String.Format("{0:dd-MM-yyyy}", CDate(e.Row.Cells(16).Text))
    '            End If
    '            If (e.Row.Cells(28).Text <> "&nbsp;") Then
    '                e.Row.Cells(28).Text = String.Format("{0:dd-MM-yyyy}", CDate(e.Row.Cells(28).Text))
    '            End If


    '        End If
    '    Catch ex As Exception

    '    End Try

    'End Sub

    Protected Sub ASPxButton1_Click(sender As Object, e As EventArgs) Handles btnExportarExcel.Click
        ASPxGridViewExporter1.WriteXlsToResponse()

    End Sub


End Class


