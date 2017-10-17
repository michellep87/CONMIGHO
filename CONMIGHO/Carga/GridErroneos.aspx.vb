
Partial Class Carga_GridErroneos
    Inherits System.Web.UI.Page

    Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        SqlDataSource1.DataBind()
    End Sub
    Protected Sub ASPxButton1_Click(sender As Object, e As EventArgs) Handles btnExportar.Click
        ASPxGridViewExporter1.WriteXlsToResponse()
    End Sub
End Class
