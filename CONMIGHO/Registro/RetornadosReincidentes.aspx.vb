
Partial Class Registro_RetornadosReincidentes
    Inherits System.Web.UI.Page

    Private Sub Registro_RetornadosReincidentes_Load(sender As Object, e As EventArgs) Handles Me.Load
        hfIdentidad.Value = Request.QueryString("num")

        'sqlRetornados.SelectParameters(0).DefaultValue = hfIdentidad.Value
        sqlRetornados.DataBind()
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Private Sub btnExportar_Click(sender As Object, e As EventArgs) Handles btnExportar.Click
        ASPxGridViewExporter1.WriteXlsToResponse()
    End Sub
End Class
