<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="RegistrosCarga.aspx.vb" Inherits="Carga_RegistrosCarga" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style7 {
            text-align: right;
            font-size: medium;
            width: 97px;
        }
        .auto-style8 {
            width: 213px;
        }
        .auto-style9 {
            text-align: left;
            width: 213px;
        }
        .auto-style10 {
            width: 97px;
        }
        .auto-style11 {
            text-align: right;
            font-size: medium;
        }
        .auto-style12 {
            width: 96%;
        }
        .auto-style13 {
            width: 129px;
        }
        .auto-style14 {
            text-align: right;
            font-size: medium;
            width: 129px;
        }
        .auto-style18 {
            text-align: right;
            font-size: medium;
            width: 137px;
        }
        .auto-style19 {
            width: 137px;
        }
        .auto-style20 {
            width: 139px;
        }
        .auto-style21 {
            text-align: right;
            font-size: medium;
            width: 139px;
        }
        .auto-style23 {
            text-align: right;
            font-size: medium;
            width: 246px;
        }
        .auto-style24 {
            width: 246px;
        }
        .auto-style25 {
            text-align: left;
            font-size: medium;
        }
        .auto-style26 {
            text-align: center;
            font-size: medium;
        }
        .auto-style27 {
            width: 276px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1 class="auto-style26"><strong>Registros de Carga de Archivos</strong></h1>
    <p class="alignright">&nbsp;</p>
    <p class="alignright">&nbsp;</p>
<p class="alignright">
    <table class="auto-style12">
        <tr>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style13">&nbsp;</td>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style20">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">
                AÑO:</td>
            <td class="auto-style9">
                <dx:ASPxComboBox ID="ddlAnio" runat="server" Theme="DevEx">
                    <ClearButton DisplayMode="Always">
                    </ClearButton>
                </dx:ASPxComboBox>
            </td>
            <td class="auto-style14">MES:</td>
            <td class="auto-style18">
                <dx:ASPxComboBox ID="ddlMes" runat="server" DataSourceID="sqlMeses" TextField="Mes" Theme="DevEx" ValueField="Id">
                    <ClearButton DisplayMode="Always">
                    </ClearButton>
                </dx:ASPxComboBox>
            </td>
            <td class="auto-style23">Semana:</td>
            <td class="auto-style25">
                <dx:ASPxSpinEdit ID="txtSemana" runat="server" Height="16px" Number="0" Theme="DevEx" Width="74px">
                    <ClearButton DisplayMode="Always">
                    </ClearButton>
                </dx:ASPxSpinEdit>
            </td>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style11">
                <asp:Button ID="btnGenear" runat="server" Text="Generar" />
            </td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style8"></td>
            <td class="auto-style13"></td>
            <td class="auto-style19"></td>
            <td class="auto-style24"></td>
            <td></td>
            <td class="auto-style20"></td>
            <td></td>
        </tr>
    </table>
</p>
    <div style="overflow-x:auto;width:1300px; height: auto;overflow-y: auto" >
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SqlServices %>" SelectCommand="spBuscarRegistros" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="Anio" />
                <asp:Parameter Name="Mes" />
                <asp:Parameter Name="Semana" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />

        <dx:ASPxGridView ID="gvRegistrados" runat="server" Theme="DevEx" ClientIDMode="AutoID" Visible="False">
            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sqlMeses" runat="server" ConnectionString="<%$ ConnectionStrings:SqlServices %>" SelectCommand="SELECT [Id], [Mes] FROM [Meses]">
        </asp:SqlDataSource>
        <br />
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="gvRegistrados">
        </dx:ASPxGridViewExporter>
        <%--
        <asp:GridView ID="gvRegistros" runat="server" 
        CssClass="table table-bordered bs-table" style="font-size: small" AllowPaging="True" OnPageIndexChanging="gvRegistros_PageIndexChanging">
 
     <PagerSettings PageButtonCount="4" FirstPageText="First" LastPageText="Last"/>  
        <EditRowStyle BackColor="#ffffcc" />
        <EmptyDataRowStyle forecolor="Red" CssClass="table table-bordered" />
        <emptydatatemplate>
            ¡No Registros!  
        </emptydatatemplate>           
 
        <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageText="First" LastPageImageUrl="Last" />
    </asp:GridView>--%>
    </div>
    <table style="width: 100%;">
        <tr>
            <td class="auto-style27">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style27">
        <dx:ASPxButton ID="btnExportarExcel" runat="server" Text="Exportar a Excel" Theme="Moderno" Visible="False">
            <Image IconID="export_exporttoxls_16x16">
            </Image>
        </dx:ASPxButton>
            </td>
            <td>
        <dx:ASPxButton ID="btnEliminarDatos" runat="server" Text="Eliminar Carga" Theme="Moderno">
            <Image IconID="actions_cancel_16x16">
            </Image>
        </dx:ASPxButton>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style27">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <dx:ASPxPopupControl ID="puEliminarCarga" runat="server" HeaderText="" Width="350px" AutoUpdatePosition="True" CloseAction="None" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
                    <ContentCollection>
                        <dx:PopupControlContentControl runat="server">
                            <table style="width:100%;">
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <dx:ASPxLabel ID="lblCambioEstado" runat="server" Text="Esta Seguro que desea Eliminar el Registro?">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width:100%;">
                                            <tr>
                                                <td align="right">
                                                    <dx:ASPxButton ID="btnAceptar" runat="server" Text="Aceptar" style="height: 23px">
                                                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar">
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
   
</asp:Content>

