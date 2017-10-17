<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="RegistroMigrantes.aspx.vb" Inherits="Registro_RegistroMigrantes" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            width: 351px;
        }
        .auto-style12 {
            width: 188px;
        }
        .auto-style14 {
            width: 267px;
        }
        .auto-style18 {
            width: 354px;
        }
        .auto-style19 {
            text-align: right;
            width: 191px;
        }
        .auto-style20 {
            width: 191px;
        }
        .auto-style21 {
            text-align: right;
            width: 188px;
        }
        .auto-style22 {
            text-align: right;
            width: 206px;
        }
        .auto-style23 {
            text-align: left;
            width: 188px;
        }
        .auto-style28 {
            width: 267px;
            text-align: left;
        }
        .auto-style30 {
            width: 184px;
        }
        .auto-style31 {
            width: 184px;
            text-align: right;
        }
        .auto-style32 {
            text-align: right;
            width: 354px;
        }
        .auto-style38 {
            width: 140px;
        }
        .auto-style46 {
            width: 234px;
        }
        .auto-style61 {
            width: 46px;
        }
        .auto-style65 {
            width: 48px;
        }
        .auto-style66 {
            width: 84px;
        }
        .auto-style67 {
            text-align: right;
            width: 84px;
        }
        .auto-style68 {
            width: 338px;
        }
        .auto-style69 {
            text-align: right;
            width: 338px;
        }
        .auto-style72 {
            width: 477px;
        }
        .auto-style73 {
            text-align: right;
            width: 477px;
        }
        .auto-style74 {
            width: 184px;
            text-align: right;
            height: 16px;
        }
        .auto-style75 {
            width: 267px;
            height: 16px;
        }
        .auto-style76 {
            text-align: right;
            height: 16px;
        }
        .auto-style77 {
            height: 16px;
        }
        .auto-style78 {
            text-align: right;
            width: 354px;
            height: 16px;
        }

        input,
        select,
        textarea {
            max-width:710px;
        }
        .auto-style79 {
            width: 184px;
            text-align: left;
        }
        </style>
     <script type ="text/javascript">
    

    function AbrirVentana(url) {

        window.open(url, '');
        return false;

    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowCollapseButton="true" Theme="Moderno" Width="1327px" HeaderText="Registro de Datos de los Retornados">
        <PanelCollection>
            <dx:PanelContent runat="server">
             
                <dx:ASPxCallbackPanel ID="CallbackPanel1" runat="server" Width="1297px" ClientInstanceName="CallbackPanel1">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <table style="width:100%;">
                                <tr>
                                    <td class="auto-style79" colspan="3">
                                        <dx:ASPxLabel ID="lblAviso" runat="server" Text="ASPxLabel" Visible="False">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style30">&nbsp;</td>
                                    <td class="auto-style14">&nbsp;</td>
                                    <td class="auto-style23">&nbsp;</td>
                                    <td class="auto-style19">&nbsp;</td>
                                    <td class="Derecha" colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style30">No de Identidad:</td>
                                    <td class="auto-style14">
                                        <dx:ASPxTextBox ID="txtNumIdentidad" runat="server" Theme="DevEx" Width="270px">
                                        </dx:ASPxTextBox>
                                        &nbsp; </td>
                                    <td class="auto-style23">
                                        <dx:ASPxButton ID="btnBuscar0" runat="server" Text="Buscar" Theme="Moderno" Width="16px">
                                            <ClientSideEvents Click="function(s, e) {
	CallbackPanel1.PerformCallback();
}" />
                                            <Image IconID="zoom_zoom_16x16">
                                            </Image>
                                        </dx:ASPxButton>
                                    </td>
                                    <td class="auto-style19">&nbsp;</td>
                                    <td class="Derecha" colspan="4">
                                        <asp:Label ID="lblAdvertencia" runat="server" CssClass="auto-style5" ForeColor="Red" Text="Retornado Reincidente" Visible="False"></asp:Label>
                                        <asp:Image ID="imgAdvertencia" runat="server" Height="27px" ImageUrl="~/Imagenes/Advertencia.png" Visible="False" Width="43px" />
                                        <asp:LinkButton ID="lnkbReincidentes" runat="server" CssClass="auto-style8" OnClientClick="javascript:AbrirVentana('RetornadosReincidentes.aspx')" Visible="False">Visualizar</asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style30">&nbsp;</td>
                                    <td class="auto-style14">&nbsp;</td>
                                    <td class="auto-style12">&nbsp;</td>
                                    <td class="auto-style20">&nbsp;</td>
                                    <td class="auto-style18">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style31"><span class="auto-style5">Año: &nbsp;</span></td>
                                    <td class="auto-style14">
                                        <dx:ASPxSpinEdit ID="txtAnio" runat="server" Theme="DevEx" Width="100px">
                                            
                                        </dx:ASPxSpinEdit>
                                    </td>
                                    <td class="auto-style21">Mes:&nbsp;&nbsp; </td>
                                    <td class="auto-style20">
                                        <dx:ASPxComboBox ID="cboMeses" runat="server" Theme="DevEx" DataSourceID="sqlMes" TextField="Mes" ValueField="Id">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style32">Semana:&nbsp;&nbsp; </td>
                                    <td>
                                        <dx:ASPxSpinEdit ID="seSemana" runat="server" Number="0" Theme="DevEx" Width="80px">
                                        </dx:ASPxSpinEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style30">&nbsp;</td>
                                    <td class="auto-style14">&nbsp;</td>
                                    <td class="auto-style21">&nbsp;</td>
                                    <td class="auto-style20">&nbsp;</td>
                                    <td class="auto-style32">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style31">Fecha Llegada:&nbsp; </td>
                                    <td class="auto-style14">
                                        <dx:ASPxDateEdit ID="deFechaLlegada" runat="server" Theme="DevEx" DisplayFormatString="dd/MM/yyyy">
                                         <ClientSideEvents ValueChanged ="function(s, e) {
	CallbackPanel1.PerformCallback();
}" />
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="auto-style21">Lugar Llegada:&nbsp;&nbsp; </td>
                                    <td class="auto-style20">
                                        <dx:ASPxComboBox ID="cboLugarLlegada" runat="server" Theme="DevEx" Width="172px" DataSourceID="sqlLugarLlegada" TextField="LugarLlegada" ValueField="id">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style32">Dia Llegada:&nbsp;&nbsp; </td>
                                    <td>
                                        <dx:ASPxComboBox ID="cboDiaLlegada" runat="server" Theme="DevEx" DataSourceID="sqldias" TextField="dia" ValueField="Id">
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style30">&nbsp;</td>
                                    <td class="auto-style14">&nbsp;</td>
                                    <td class="auto-style21">&nbsp;</td>
                                    <td class="auto-style20">&nbsp;</td>
                                    <td class="auto-style32">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style31">Pais Procedencia: &nbsp; </td>
                                    <td class="auto-style14">
                                        <dx:ASPxComboBox ID="cboPais" runat="server" Theme="DevEx" Width="265px" DataSourceID="sqlPaises" TextField="NombrePais" ValueField="CodPais">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style21">Estado:</td>
                                    <td class="auto-style20">
                                        <dx:ASPxComboBox ID="cboEstado" runat="server" Theme="DevEx" Width="172px" DataSourceID="sqlEstados" TextField="NombreEstado" ValueField="CodEstado">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	CallbackPanel1.PerformCallback();
}" /></dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="sqlEstados" runat="server" ConnectionString="<%$ ConnectionStrings:SqlServices %>" SelectCommand="Select 0 as [CodEstado], '---------------' as [NombreEstado]
union

SELECT [CodEstado]
      ,[NombreEstado]
FROM [dbo].[Estados]"></asp:SqlDataSource>
                                    </td>
                                    <td class="auto-style32">Oficina Consular:&nbsp;&nbsp; </td>
                                    <td>
                                        <dx:ASPxComboBox ID="cboOficinaConsular" runat="server" Theme="DevEx" Width="172px" DataSourceID="sqlOficinasConsulares" TextField="NombreOficinasConsular" ValueField="CodOficinasConsular">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	CallbackPanel1.PerformCallback();
}" />
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="sqlOficinasConsulares" runat="server" ConnectionString="<%$ ConnectionStrings:SqlServices %>" SelectCommand="Select 0 as CodOficinasConsular,
'---------------' as NombreOficinasConsular
union
SELECT[CodOficinasConsular]
      ,[NombreOficinasConsular]
FROM [dbo].[OficinasConsulares] where CodEstado=@Estado">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="cboEstado" Name="Estado" PropertyName="Value" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style30">&nbsp;</td>
                                    <td class="auto-style14">&nbsp;</td>
                                    <td class="auto-style21">&nbsp;</td>
                                    <td class="auto-style20">&nbsp;</td>
                                    <td class="auto-style32">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style31">Via Retorno:&nbsp;&nbsp;&nbsp; </td>
                                    <td class="auto-style14">
                                        <dx:ASPxComboBox ID="cboViaRetorno" runat="server" Theme="DevEx" Width="172px" DataSourceID="sqlViaRetorno" TextField="NombreViaRetorno" ValueField="CodViaRetorno">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style21">Tipo Deportacion: </td>
                                    <td class="auto-style20">
                                        <dx:ASPxComboBox ID="cboTipoDeportacion" runat="server" Height="15px" Theme="DevEx" Width="172px" DataSourceID="sqlTipoDeportacion" TextField="NombreTipoDeportacion" ValueField="CodTipoDeportacion">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style32">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style31">&nbsp;</td>
                                    <td class="auto-style14">&nbsp;</td>
                                    <td class="auto-style21">&nbsp;</td>
                                    <td class="auto-style20">&nbsp;</td>
                                    <td class="auto-style32">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                               
                                <tr>
                                    <td class="auto-style31">&nbsp;</td>
                                    <td class="auto-style14">&nbsp;</td>
                                    <td class="auto-style21">&nbsp;</td>
                                    <td class="auto-style20">&nbsp;</td>
                                    <td class="auto-style32">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style31">Nombre Completo:</td>
                                    <td class="auto-style14" colspan="3">
                                        <dx:ASPxTextBox ID="txtNombre" runat="server" Width="550px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style32">&nbsp;</td>
                                    <td class="auto-style20">&nbsp;</td>
                                    <td class="auto-style22">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style31">&nbsp;</td>
                                    <td class="auto-style14" colspan="3">&nbsp;</td>
                                    <td class="auto-style32">&nbsp;</td>
                                    <td class="auto-style20">&nbsp;</td>
                                    <td class="auto-style22">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                               <tr>
                                    <td class="auto-style31">&nbsp;</td>
                                    <td class="auto-style14" colspan="3">
                                        &nbsp;</td>
                                    <td class="auto-style32">&nbsp;</td>
                                    <td class="auto-style20">
                                        &nbsp;</td>
                                    <td class="auto-style22">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                               
                               <tr>
                                    <td class="auto-style31">Departamento:</td>
                                    <td class="auto-style14">
                                        <dx:ASPxComboBox ID="cboDepartamento" runat="server" Width="265px" Height="10px" Theme="DevEx" DataSourceID="sqlDeptos" TextField="NombreDepartamento" ValueField="CodDepartamento">
                                       <ClientSideEvents SelectedIndexChanged="function(s, e) {
	CallbackPanel1.PerformCallback();
}" />
                                             </dx:ASPxComboBox>
                                    </td>
                                    <td class="Derecha">Municipio:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="cboMunicipio" runat="server" Width="265px" Theme="DevEx" DataSourceID="sqlMunicipios" TextField="NombreMunicipio" ValueField="CodMunicipio">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="sqlMunicipios" runat="server" ConnectionString="<%$ ConnectionStrings:SqlServices %>" SelectCommand="Select 0 CodMunicipio,'---------------' NombreMunicipio

union

SELECT [CodMunicipio]
      ,[NombreMunicipio]
      
  FROM [dbo].[Municipios] where CodDepartamento=@depto">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="cboDepartamento" Name="depto" PropertyName="Value" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="auto-style32">Fecha Nacimiento:</td>
                                    <td>
                                        <dx:ASPxDateEdit ID="deFechaNacimiento" runat="server" Theme="DevEx" DisplayFormatString="dd/MM/yyyy">
                                            <ClientSideEvents ValueChanged  ="function(s, e) {
	CallbackPanel1.PerformCallback();
}" />
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="Derecha">Edad:</td>
                                    <td>
                                        <dx:ASPxSpinEdit ID="seEdad" runat="server" Number="0" Theme="DevEx" Width="80px">
                                        </dx:ASPxSpinEdit>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td class="auto-style74"></td>
                                    <td class="auto-style75"></td>
                                    <td class="auto-style76"></td>
                                    <td class="auto-style77"></td>
                                    <td class="auto-style78"></td>
                                    <td class="auto-style77"></td>
                                    <td class="auto-style76"></td>
                                    <td class="auto-style77"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style31">&nbsp;</td>
                                    <td class="auto-style14">&nbsp;</td>
                                    <td class="Derecha">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td class="auto-style32">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td class="Derecha">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style31">Adulto/NNA:</td>
                                    <td class="auto-style28">
                                        <dx:ASPxRadioButtonList ID="rblAdulto" runat="server" RepeatDirection="Horizontal">
                                            <Items>
                                                <dx:ListEditItem Text="Adulto" Value="Adulto" />
                                                <dx:ListEditItem Text="NNA" Value="NNA" />
                                            </Items>
                                        </dx:ASPxRadioButtonList>
                                    </td>
                                    <td class="Derecha">Genero:</td>
                                    <td>
                                        <dx:ASPxComboBox ID="cboGenero" runat="server" DataSourceID="sqlGeneros" TextField="NombreGenero" Theme="DevEx" ValueField="CodGenero" Width="172px">
                                            
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="Derecha" colspan="2">Viaja Solo/Acompañado:</td>
                                    <td colspan="2">
                                        <dx:ASPxComboBox ID="cboViajaSolo" runat="server" DataSourceID="sqlViajaSolo" TextField="Descripion" Theme="DevEx" ValueField="id" Width="172px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	CallbackPanel1.PerformCallback();
}" />
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="Derecha">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                               
                                <tr>
                                    <td class="auto-style31">&nbsp;</td>
                                    <td class="auto-style28">&nbsp;</td>
                                    <td class="Derecha">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td class="Derecha" colspan="2">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td class="Derecha">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                               
                            </table>
                            <dx:ASPxPanel ID="pnlAcompanante" runat="server" Width="1283px">
                                
                                <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style66">&nbsp;</td>
            <td class="auto-style65">&nbsp;</td>
            <td class="auto-style68">&nbsp;</td>
            <td class="auto-style61">&nbsp;</td>
            <td class="auto-style72">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style67">Unidad Familiar:</td>
            <td class="auto-style65">
                <dx:ASPxSpinEdit ID="seUnidadFamiliar" runat="server" Number="0" Theme="DevEx" Width="80px">
                </dx:ASPxSpinEdit>
            </td>
            <td class="auto-style69">No Personas Acompañan Menor:</td>
            <td class="auto-style61">
              
                <dx:ASPxSpinEdit ID="seNumPersonanAcompanan" runat="server" Number="0" Theme="DevEx" Width="80px">
                </dx:ASPxSpinEdit>
            </td>
            <td class="auto-style73">Parentesco:</td>
            <td colspan="2">
                <dx:ASPxComboBox ID="cboParentesco" runat="server" Height="15px" Theme="DevEx" Width="172px" DataSourceID="sqlParentescos" TextField="NombreParentesco" ValueField="CodParentesco">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style66">&nbsp;</td>
            <td class="auto-style65">&nbsp;</td>
            <td class="auto-style68">&nbsp;</td>
            <td class="auto-style61">&nbsp;</td>
            <td class="auto-style72">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style67">Nombre Acompañante:</td>
            <td class="auto-style46" colspan="3">
                <dx:ASPxTextBox ID="txtNombreAcompanante" runat="server" Width="550px">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style73">No de Identidad:</td>
            <td class="auto-style38">
                <dx:ASPxTextBox ID="txtNumIdentidadAdulto" runat="server" Theme="DevEx" Width="270px">
                </dx:ASPxTextBox>
            </td>
        </tr>
         <tr>
            <td class="auto-style66">&nbsp;</td>
            <td class="auto-style65">&nbsp;</td>
            <td class="auto-style68">&nbsp;</td>
            <td class="auto-style61">&nbsp;</td>
            <td class="auto-style72">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
                                    <td class="auto-style31">Departamento:</td>
                                    <td class="auto-style14">
                                        <dx:ASPxComboBox ID="cboDepartamentoAdulto" runat="server" Width="265px" Height="10px" Theme="DevEx" DataSourceID="sqlDeptos" TextField="NombreDepartamento" ValueField="CodDepartamento">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	CallbackPanel1.PerformCallback();
}" />
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style69">Municipio:</td>
                                    <td class="auto-style61">
                                        <dx:ASPxComboBox ID="cboMunicipioAdulto" runat="server" Width="265px" Theme="DevEx" DataSourceID="sqlMunicipios1" TextField="NombreMunicipio" ValueField="CodMunicipio">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="sqlMunicipios1" runat="server" ConnectionString="<%$ ConnectionStrings:SqlServices %>" SelectCommand="Select 0 CodMunicipio,'---------------' NombreMunicipio

union

SELECT [CodMunicipio]
      ,[NombreMunicipio]
      
  FROM [dbo].[Municipios] where CodDepartamento=@depto">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="cboDepartamentoAdulto" Name="depto" PropertyName="Value" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="auto-style73">Fecha Nacimiento:</td>
                                    <td>
                                        <dx:ASPxDateEdit ID="deFechaNacimientoAdulto" runat="server" Theme="DevEx" DisplayFormatString="dd/MM/yyyy">
                                            <ClientSideEvents ValueChanged="function(s, e) {
	CallbackPanel1.PerformCallback();
}" />
                                        </dx:ASPxDateEdit>
                                    </td>
                                    
                                </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style61">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="Derecha">Edad:</td>
                                    <td>
                                        <dx:ASPxSpinEdit ID="seEdadAdulto" runat="server" Number="0" Theme="DevEx" Width="80px">
                                        </dx:ASPxSpinEdit>
                                    </td>
            <td class="auto-style68">Genero:</td>
            <td class="auto-style61">
                <dx:ASPxComboBox ID="cboGeneroAdulto" runat="server" DataSourceID="sqlGeneros" TextField="NombreGenero" Theme="DevEx" ValueField="CodGenero" Width="172px">
                    
                </dx:ASPxComboBox>
            </td>
            <td class="auto-style72">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style61">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        
    </table>
    
                                    </dx:PanelContent>
</PanelCollection>
                                
                            </dx:ASPxPanel>
                            <table>
         <tr>
            <td class="auto-style67">Delito:</td>
            <td class="auto-style46" colspan="3">
                <dx:ASPxTextBox ID="txtDelito" runat="server" Width="550px">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style73"></td>
            <td class="auto-style38">
                
            </td>
        </tr>
         <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style61">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Condicion Medica:</td>
            <td colspan="3">
                <dx:ASPxTextBox runat="server" ID="txtCondicionMedica" Width="550px"></dx:ASPxTextBox>

            </td>
        </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="3">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td></td>
                                    <td>
                                        <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar Datos" Theme="DevEx">
                                            <Image IconID="save_save_16x16">
                                            </Image>
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnEditar" runat="server" Text="Editar Datos" Theme="DevEx">
                                            <Image IconID="actions_convert_16x16">
                                            </Image>
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnEliminar" runat="server" Text="Eliminar Datos" Theme="DevEx">
                                            <Image IconID="actions_cancel_16x16">
                                            </Image>
                                        </dx:ASPxButton>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
    </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
                <dx:ASPxPopupControl ID="ASPxPopupControl2" runat="server" HeaderText="" Width="350px" AutoUpdatePosition="True" CloseAction="None" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
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
                <br />
               <asp:SqlDataSource ID="sqlDeptos" runat="server" ConnectionString="<%$ ConnectionStrings:SqlServices %>" SelectCommand="Select 0 as CodDepartamento,'---------------' as NombreDepartamento 

union SELECT [CodDepartamento]
      ,[NombreDepartamento]
     
  FROM [dbo].[Departamentos]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sqldias" runat="server" ConnectionString="<%$ ConnectionStrings:SqlServices %>" SelectCommand="Select 0 as Id, '---------------' as dia
union

SELECT  [Id]
      ,[Dia]
  FROM [dbo].[Dia]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="sqlGeneros" runat="server" ConnectionString='<%$ ConnectionStrings:SqlServices %>' SelectCommand="SELECT [CodGenero]
      ,[NombreGenero]
  FROM [dbo].[Generos]">

                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sqlLugarLlegada" runat="server" ConnectionString='<%$ ConnectionStrings:SqlServices %>' SelectCommand="Select 0 as id,
'---------------' as LugarLlegada
union
SELECT  [Id]
      ,[LugarLlegada]
  FROM [dbo].[LugarLlegada]">

                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sqlPaises" runat="server" ConnectionString='<%$ ConnectionStrings:SqlServices %>' SelectCommand="Select 0 as CodPais,'---------------' as NombrePais
union
SELECT[CodPais],[NombrePais] FROM [dbo].[Paises]">

                </asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="sqlParentescos" ConnectionString='<%$ ConnectionStrings:SqlServices %>' SelectCommand="Select 0 as CodParentesco,'---------------' as NombreParentesco
union
SELECT [CodParentesco]
      ,[NombreParentesco]
FROM [dbo].[Parentesco]">

               </asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="sqlTipoDeportacion" ConnectionString='<%$ ConnectionStrings:SqlServices %>' SelectCommand="Select 0 as CodTipoDeportacion,'---------------' as NombreTipoDeportacion
union
SELECT [CodTipoDeportacion]
      ,[NombreTipoDeportacion]
      
  FROM [dbo].[TipoDeportacion]">

                </asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="sqlViajaSolo" ConnectionString='<%$ ConnectionStrings:SqlServices %>' SelectCommand=" Select 0 as Id,'---------------' as Descripion
union
SELECT [id]
      ,[Descripion]
FROM [dbo].[ViajaSoloAcompaniado]"></asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="sqlViaRetorno" ConnectionString='<%$ ConnectionStrings:SqlServices %>' SelectCommand="Select 0 as CodViaRetorno,'---------------' as NombreViaRetorno
union
SELECT [CodViaRetorno]
      ,[NombreViaRetorno]
      
  FROM [dbo].[ViaRetorno]">

                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sqlAdulto" runat="server"></asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="sqlMes" ConnectionString='<%$ ConnectionStrings:SqlServices %>' SelectCommand="Select 0 as Id,'---------------' as Mes
union
SELECT [Id],[Mes]
FROM [dbo].[Meses]">

                </asp:SqlDataSource>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    
</asp:Content>

