
Partial Class Carga_GridCorrectos
    Inherits System.Web.UI.Page

    Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)

    End Sub
    Protected Sub btnExportar_Click(sender As Object, e As EventArgs) Handles btnExportar.Click
        ASPxGridViewExporter1.WriteXlsToResponse()
    End Sub
End Class
