<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="HistorialRetornados.aspx.vb" Inherits="Registro_HistorialRetornados" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style6 {
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <asp:SqlDataSource ID="sqlRegistros" runat="server" ConnectionString="<%$ ConnectionStrings:SqlServices %>" SelectCommand="SELECT r.[ID]
      ,[Año]
      ,mm.Mes
      ,[Semana]
	  ,dd.Dia
      ,[FechaLlegada] as &quot;Fecha de Llegada&quot;
      ,ll.LugarLlegada as &quot;Lugar de Llegada&quot;
      ,pp.NombrePais as &quot;Pais&quot;
      ,es.NombreEstado as &quot;Estado del Pais&quot;
      ,oc.NombreOficinasConsular as &quot;Oficina Consular&quot;
      ,vr.NombreViaRetorno as &quot;Via de Retorno&quot;
      ,td.NombreTipoDeportacion as &quot;Tipo de Deportacion&quot;
      ,[NumIdentidadCompleto] as &quot;Numero de Identidad&quot;
      ,[NombreCompleto] as &quot;Nombre&quot;
      ,dp.NombreDepartamento as &quot;Departamento&quot;
      ,mp.NombreMunicipio as &quot;Municipio&quot;
      ,[FechaNacimiento] as &quot;Fecha de Nacimiento&quot;
      ,[Edad]
	  ,[Habilitado]
  FROM [CONMIGHO].[dbo].[Registros] r with (NOLOCK)
  inner join Departamentos dp on (r.CodDepartamento=dp.CodDepartamento)
  inner join Municipios mp on (r.CodMunicipio=mp.CodMunicipio) 
  left outer join Estados es on (r.CodEstado=es.CodEstado)
  inner join Generos gn on (r.CodGenero=gn.CodGenero) 
  inner join LugarLlegada ll on (r.CodLugarLlegada=ll.Id)
  inner join Meses mm on (r.Mes =mm.Id)
  inner join meses mm2 on (r.MesNacimiento=mm2.Id) 
 left outer join OficinasConsulares oc on (r.CodOficinaConsular=oc.CodOficinasConsular)
  inner join dia dd on (r.dia=dd.id)
  inner join Paises pp on (r.CodPaisProcedencia=pp.CodPais)
  inner join ViaRetorno vr on (r.CodViaRetorno=vr.CodViaRetorno)
  inner join TipoDeportacion td on (r.CodTipoDeportacion=td.CodTipoDeportacion)
  left outer join Generos gn2 on (r.CodGeneroAdulto=gn2.CodGenero)
  left outer join Parentesco pt on (r.CodParentesco=pt.CodParentesco)
  left outer join meses mm3 on (r.MesNacimientoAdulto=mm3.Id)
  left outer join Departamentos dp2 on (r.CodDepartamentoAdulto=dp2.CodDepartamento)
  left outer join Municipios mp2 on (r.CodMunicipioAdulto=mp2.CodMunicipio)"></asp:SqlDataSource>
    <div style="overflow-x:auto;width:1250px; height: auto;overflow-y: auto" >
         <br />
         <dx:ASPxHyperLink ID="hlNuevo" runat="server" CssClass="auto-style6" NavigateUrl="~/Registro/RegistroMigrantes.aspx" Text="Nuevo Registro" />
         <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sqlRegistros" KeyFieldName="ID" Theme="Moderno">
             <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataHyperLinkColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" Caption="Accion" PropertiesHyperLinkEdit-Target="_blank" >
                <EditFormSettings Visible="False" />
                 <PropertiesHyperLinkEdit NavigateUrlFormatString="RegistroMigrantes.aspx?Id={0}" Text="Editar">
                </PropertiesHyperLinkEdit>
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Semana" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Dia" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Fecha de Llegada" VisibleIndex="6">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Lugar de Llegada" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Pais" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Estado del Pais" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Oficina Consular" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Via de Retorno" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Tipo de Deportacion" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Numero de Identidad" ReadOnly="True" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Departamento" VisibleIndex="15">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Municipio" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Fecha de Nacimiento" VisibleIndex="17">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Edad" VisibleIndex="18">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Habilitado" VisibleIndex="19">
            </dx:GridViewDataCheckColumn>
        </Columns>
    </dx:ASPxGridView>

    </div>
   
</asp:Content>

