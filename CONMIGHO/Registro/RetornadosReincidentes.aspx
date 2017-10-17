<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="RetornadosReincidentes.aspx.vb" Inherits="Registro_RetornadosReincidentes" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   
    <h1 class="auto-style2"><strong>Datos de Retornado Reincidente</strong></h1>
    <p class="auto-style2">
        <asp:HiddenField ID="hfIdentidad" runat="server" />
    </p>
    <p class="auto-style2">
        <dx:ASPxGridView ID="gvRetornadoReincidente" runat="server" AutoGenerateColumns="False" DataSourceID="sqlRetornados" EnableTheming="True" KeyFieldName="id" Theme="Moderno">
            <Columns>
                <dx:GridViewDataHyperLinkColumn FieldName="Id" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
                 <PropertiesHyperLinkEdit NavigateUrlFormatString="RegistroMigrantes.aspx?Id={0}">
                </PropertiesHyperLinkEdit>
            </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Semana" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Dia" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha Llegada" VisibleIndex="5">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Lugar Llegada" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Pais de Retorno" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Via Retorno" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Tipo Deportacion" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NumIdentidadCompleto" ReadOnly="True" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NombreCompleto" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="gvRetornadoReincidente">
        </dx:ASPxGridViewExporter>
        <dx:ASPxButton ID="btnExportar" runat="server" Text="Exportar a Excel" Theme="Moderno">
            <Image Url="~/Imagenes/excel32.png">
            </Image>
        </dx:ASPxButton>
        <asp:SqlDataSource ID="sqlRetornados" runat="server" ConnectionString="<%$ ConnectionStrings:SqlServices %>" SelectCommand="Select
r.id as Id,
Año,m.Mes,semana as 'Semana',d.Dia,FechaLlegada as 'Fecha Llegada' ,ll.LugarLlegada as 'Lugar Llegada',ps.NombrePais as 'Pais de Retorno',vr.NombreViaRetorno as 'Via Retorno',td.NombreTipoDeportacion as 'Tipo Deportacion'
,NumIdentidadCompleto,NombreCompleto
from Registros r with (NoLock)
inner join Meses m on (r.Mes=m.Id)
inner join Dia d on (r.Dia=d.id)
inner join LugarLlegada ll on (r.CodLugarLlegada=ll.Id)
inner join Paises ps on (r.CodPaisProcedencia=ps.CodPais)
inner join ViaRetorno vr on (r.CodViaRetorno=vr.CodViaRetorno)
inner join TipoDeportacion td on (r.CodTipoDeportacion=td.CodTipoDeportacion)
where NumIdentidadCompleto=@Identidad">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfIdentidad" Name="Identidad" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
   
</asp:Content>

