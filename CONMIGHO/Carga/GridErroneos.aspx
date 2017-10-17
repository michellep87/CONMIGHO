<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="GridErroneos.aspx.vb" Inherits="Carga_GridErroneos" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1 class="alignright"><strong>ERRORES PRESENTADOS EN LA CARGA</strong></h1>
    <br />
    <dx:ASPxGridView ID="gvErrores" runat="server" DataSourceID="SqlDataSource1" EnableTheming="True" Theme="Moderno"></dx:ASPxGridView>
    <%--<asp:GridView ID="GridView1" runat="server" 
        AutoGenerateColumns="False" 
        CssClass="table table-bordered bs-table" PageSize="10" style="font-size: small" DataSourceID="SqlDataSource1" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging">
 
       <PagerSettings PageButtonCount="4" FirstPageText="First" LastPageText="Last"/>  
        <Columns>
             
            <asp:BoundField DataField="idcarga" HeaderText="Linea" SortExpression="idcarga" />
            <asp:BoundField DataField="Campo" HeaderText="Campo" SortExpression="Campo" />
            <asp:BoundField DataField="Observacion" HeaderText="Observacion" SortExpression="Observacion" />
            
           
        </Columns>
        <EditRowStyle BackColor="#ffffcc" />
        <EmptyDataRowStyle forecolor="Red" CssClass="table table-bordered" />
        <emptydatatemplate>
            ¡No Registros!  
        </emptydatatemplate>           
 
        <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
        <PagerSettings FirstPageText="First" LastPageImageUrl="Last" />
    </asp:GridView>--%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CONMIGHOConnectionString %>" SelectCommand="SELECT [idcarga], [Campo], [Observacion] FROM [errores]"></asp:SqlDataSource>
    <dx:ASPxButton ID="btnExportar" runat="server" Text="Exportar a Excel" Theme="Moderno">
        <Image Url="~/Imagenes/excel32.png">
        </Image>
    </dx:ASPxButton>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="gvErrores">
    </dx:ASPxGridViewExporter>
</asp:Content>

