<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="GridCorrectos.aspx.vb" Inherits="Carga_GridCorrectos" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1 class="alignright"><strong>REGISTROS CORRECTOS PARA CARGA</strong></h1>
    <br />
    <div style="overflow-x:auto;width:1250px; height: auto;overflow-y: auto" >

        <dx:ASPxGridView ID="gvCorrectos" runat="server" DataSourceID="SqlDataSource1" EnableTheming="True" Theme="Moderno">
            <Templates>
                <EmptyDataRow>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" ForeColor="Red" Text="NO HAY REGISTROS">
                    </dx:ASPxLabel>
                </EmptyDataRow>
            </Templates>
            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        </dx:ASPxGridView>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="gvCorrectos">
        </dx:ASPxGridViewExporter>
        <dx:ASPxButton ID="btnExportar" runat="server" Text="Exportar a Excel" Theme="Moderno">
            <Image Url="~/Imagenes/excel32.png">
            </Image>
        </dx:ASPxButton>
       <%-- <asp:GridView ID="gv" runat="server" 
        AutoGenerateColumns="False" 
        CssClass="table table-bordered bs-table" PageSize="10" style="font-size: small" DataSourceID="SqlDataSource1" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging">
 
      <PagerSettings PageButtonCount="4" FirstPageText="First" LastPageText="Last"/>  
        <Columns>
             
            <asp:BoundField DataField="Idcarga" HeaderText="Idcarga" SortExpression="Idcarga" />
            <asp:BoundField DataField="Anio" HeaderText="Anio" SortExpression="Anio" />
            <asp:BoundField DataField="Mes" HeaderText="Mes" SortExpression="Mes" />


            <asp:BoundField DataField="Semana" HeaderText="Semana" SortExpression="Semana"></asp:BoundField>
            <asp:BoundField DataField="FechaLlegada" HeaderText="FechaLlegada" SortExpression="FechaLlegada"></asp:BoundField>
            <asp:BoundField DataField="LugarLlegada" HeaderText="LugarLlegada" SortExpression="LugarLlegada"></asp:BoundField>
            <asp:BoundField DataField="PaisProcedencia" HeaderText="PaisProcedencia" SortExpression="PaisProcedencia"></asp:BoundField>
            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado"></asp:BoundField>
            <asp:BoundField DataField="OficinaConsular" HeaderText="OficinaConsular" SortExpression="OficinaConsular"></asp:BoundField>
            <asp:BoundField DataField="ViaRetorno" HeaderText="ViaRetorno" SortExpression="ViaRetorno"></asp:BoundField>
            <asp:BoundField DataField="TipoDeportacion" HeaderText="TipoDeportacion" SortExpression="TipoDeportacion"></asp:BoundField>
            <asp:BoundField DataField="NombreCompleto" HeaderText="NombreCompleto" SortExpression="NombreCompleto"></asp:BoundField>
            <asp:BoundField DataField="NumIdentidad1" HeaderText="NumIdentidad1" SortExpression="NumIdentidad1"></asp:BoundField>
            <asp:BoundField DataField="NumIdentidad2" HeaderText="NumIdentidad2" SortExpression="NumIdentidad2"></asp:BoundField>
            <asp:BoundField DataField="NumIdentidad3" HeaderText="NumIdentidad3" SortExpression="NumIdentidad3"></asp:BoundField>
            <asp:BoundField DataField="NumeroIdentidad" HeaderText="NumeroIdentidad" ReadOnly="True" SortExpression="NumeroIdentidad"></asp:BoundField>
            <asp:BoundField DataField="DiaNacimiento" HeaderText="DiaNacimiento" SortExpression="DiaNacimiento"></asp:BoundField>
            <asp:BoundField DataField="MesNacimiento" HeaderText="MesNacimiento" SortExpression="MesNacimiento"></asp:BoundField>
            <asp:BoundField DataField="AnioNacimiento" HeaderText="AnioNacimiento" SortExpression="AnioNacimiento"></asp:BoundField>
            <asp:BoundField DataField="FechaNacimiento" HeaderText="FechaNacimiento" SortExpression="FechaNacimiento"></asp:BoundField>
            <asp:BoundField DataField="Sexo" HeaderText="Sexo" SortExpression="Sexo"></asp:BoundField>
            <asp:BoundField DataField="ViajaSoloAcompaniado" HeaderText="ViajaSoloAcompaniado" SortExpression="ViajaSoloAcompaniado"></asp:BoundField>
            <asp:BoundField DataField="NumeroPersonasAcompanian" HeaderText="NumeroPersonasAcompanian" SortExpression="NumeroPersonasAcompanian"></asp:BoundField>
            <asp:BoundField DataField="Parentesco" HeaderText="Parentesco" SortExpression="Parentesco"></asp:BoundField>
            <asp:BoundField DataField="NombreAcompanante" HeaderText="NombreAcompanante" SortExpression="NombreAcompanante"></asp:BoundField>
            <asp:BoundField DataField="NumIdentidadAcompanante1" HeaderText="NumIdentidadAcompanante1" SortExpression="NumIdentidadAcompanante1"></asp:BoundField>
            <asp:BoundField DataField="NumIdentidadAcompanante2" HeaderText="NumIdentidadAcompanante2" SortExpression="NumIdentidadAcompanante2"></asp:BoundField>
            <asp:BoundField DataField="NumIdentidadAcompanante3" HeaderText="NumIdentidadAcompanante3" SortExpression="NumIdentidadAcompanante3"></asp:BoundField>
            <asp:BoundField DataField="NumeroIdentidadAcompanante" HeaderText="NumeroIdentidadAcompanante" SortExpression="NumeroIdentidadAcompanante"></asp:BoundField>
            <asp:BoundField DataField="DiaNacimientoAcompanante" HeaderText="DiaNacimientoAcompanante" SortExpression="DiaNacimientoAcompanante"></asp:BoundField>
            <asp:BoundField DataField="MesNacimientoAcompanante" HeaderText="MesNacimientoAcompanante" SortExpression="MesNacimientoAcompanante"></asp:BoundField>
            <asp:BoundField DataField="AnioNacimientoAcompanante" HeaderText="AnioNacimientoAcompanante" SortExpression="AnioNacimientoAcompanante"></asp:BoundField>
            <asp:BoundField DataField="FechaNacimientoAcompanante" HeaderText="FechaNacimientoAcompanante" SortExpression="FechaNacimientoAcompanante"></asp:BoundField>
            <asp:BoundField DataField="SexoAcompanante" HeaderText="SexoAcompanante" SortExpression="SexoAcompanante"></asp:BoundField>
            <asp:BoundField DataField="Delito" HeaderText="Delito" SortExpression="Delito"></asp:BoundField>
            <asp:BoundField DataField="CondicionMedica" HeaderText="CondicionMedica" SortExpression="CondicionMedica"></asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#ffffcc" />
        <EmptyDataRowStyle forecolor="Red" CssClass="table table-bordered" />
        <emptydatatemplate>
            ¡No Registros!  
        </emptydatatemplate>           
 
        <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
        <PagerSettings FirstPageText="First" LastPageImageUrl="Last" />
    </asp:GridView>--%>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CONMIGHOConnectionString %>" SelectCommand="Select * from Cargas c where not exists (select * from errores e where c.Idcarga=e.idcarga)"></asp:SqlDataSource>
</asp:Content>

