Imports System.Data
Imports System.Security.Cryptography
Imports System.Web.Configuration
Imports Microsoft.VisualBasic

Public Class Modulo
    'Function para Encriptar la cadena
    Shared Function TamperProofStringEncode(ByVal value As String,
                           ByVal key As String) As String
        Dim ReturnValue As String = Nothing
        Dim mac3des As New MACTripleDES()
        Dim md5 As New System.Security.Cryptography.MD5CryptoServiceProvider()
        mac3des.Key = md5.ComputeHash(System.Text.Encoding.UTF32.GetBytes(key))

        ReturnValue = Convert.ToBase64String(
          System.Text.Encoding.UTF32.GetBytes(value)) & "-"c &
          Convert.ToBase64String(mac3des.ComputeHash(
          System.Text.Encoding.UTF32.GetBytes(value)))

        Return ReturnValue
    End Function

    'Function para Desencriptar la cadena
    Shared Function TamperProofStringDecode(ByVal value As String,
              ByVal key As String) As String
        Dim dataValue As String = ""
        Dim calcHash As String = ""
        Dim storedHash As String = ""

        'value = Replace(value, "@", "=")

        Dim mac3des As New System.Security.Cryptography.MACTripleDES()
        Dim md5 As New System.Security.Cryptography.MD5CryptoServiceProvider()
        mac3des.Key = md5.ComputeHash(System.Text.Encoding.UTF32.GetBytes(key))

        Try
            dataValue = Encoding.UTF32.GetString(
                    Convert.FromBase64String(value.Split("-"c)(0)))
            storedHash = System.Text.Encoding.UTF32.GetString(
                    Convert.FromBase64String(value.Split("-"c)(1)))
            calcHash = System.Text.Encoding.UTF32.GetString(
              mac3des.ComputeHash(System.Text.Encoding.UTF32.GetBytes(dataValue)))

            If storedHash <> calcHash Then
                Throw New ArgumentException("Información Invalida")
            End If
        Catch ex As Exception
            'Throw New ArgumentException("Llave Invalida")
            Return "Llave Invalida"
        End Try

        Return dataValue

    End Function

    Shared Function QueryStringEncode(ByVal value As String) As String
        If value = Nothing Then
            Return ""
        Else
            Dim TamperProofKey As String = ConfigurationManager.AppSettings("TamperProofKey")
            Return HttpUtility.UrlEncode(TamperProofStringEncode(value, TamperProofKey))
        End If
    End Function

    Shared Function QueryStringDecode(ByVal value As String) As String
        If value = Nothing Then
            Return ""
        Else
            Dim TamperProofKey As String = ConfigurationManager.AppSettings("TamperProofKey")
            Return HttpUtility.UrlDecode(TamperProofStringDecode(value, TamperProofKey))
        End If
    End Function

    Public Shared Function GetData(ByVal pQuery As String, Optional ByVal pCmdTimeOut As Integer = 30, Optional ByVal pConnectionString As String = "ConnectionString") As DataSet
        Dim ds As New DataSet
        Dim ConStr As String = WebConfigurationManager.ConnectionStrings(pConnectionString).ConnectionString
        Dim sqlCon As New SqlClient.SqlConnection(ConStr)
        sqlCon.Open()
        Dim SqlCom As New SqlClient.SqlCommand(pQuery, sqlCon)
        Dim sqlAdap As New SqlClient.SqlDataAdapter(SqlCom)
        sqlAdap.SelectCommand.CommandTimeout = pCmdTimeOut
        sqlAdap.Fill(ds)
        sqlCon.Close()
        sqlCon.Dispose()
        Return ds
    End Function
End Class
