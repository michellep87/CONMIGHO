<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="RegistroDatos.aspx.vb" Inherits="Registro_RegistroDatos" %>

<%@ Register assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link href="../Content/Site.css" rel="stylesheet" />
     <%--<link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery-1.10.2.min.js"></script>--%>
    <style type="text/css">
        .auto-style6 {
            border-top-right-radius: 3px;
            border-top-left-radius: 3px;
            font-size: small;
            border-bottom: 1px solid transparent;
            padding: 10px 15px;
        }
        .auto-style34 {
            width: 98%;
        }
        .auto-style37 {
            width: 386px;
            text-align: right;
        }
        .auto-style46 {
            font-size: x-small;
        }
        .auto-style51 {
            text-align: left;
            width: 506px;
        }
        .auto-style54 {
            width: 439px;
        }
        .auto-style55 {
            text-align: right;
            width: 261px;
        }
        .auto-style56 {
            text-align: right;
            width: 439px;
        }
        .auto-style57 {
            text-align: left;
            width: 876px;
        }
        .auto-style66 {
            width: 934px;
        }
        .auto-style67 {
            font-size: small;
            text-align: left;
            width: 911px;
        }
        .auto-style68 {
            width: 817px;
        }
        .auto-style69 {
            width: 911px;
        }
        .auto-style70 {
            width: 817px;
            font-size: small;
            text-align: left;
        }
        .auto-style72 {
            width: 728px;
            font-size: small;
        }
        .auto-style73 {
            width: 817px;
            font-size: small;
            text-align: left;
            height: 20px;
        }
        .auto-style74 {
            width: 934px;
            font-size: small;
            text-align: left;
            height: 20px;
        }
        .auto-style75 {
            width: 911px;
            font-size: small;
            height: 20px;
        }
        .auto-style77 {
            width: 911px;
            font-size: small;
        }
        .auto-style79 {
            width: 1235px;
        }
        .auto-style80 {
            width: 1235px;
            font-size: small;
            text-align: left;
        }
        .auto-style81 {
            width: 908px;
            font-size: small;
            text-align: right;
        }
        .auto-style82 {
            width: 908px;
            font-size: small;
            text-align: left;
        }
        .auto-style84 {
            font-size: small;
            text-align: left;
            width: 1220px;
        }
        .auto-style85 {
            width: 381px;
        }
        .auto-style86 {
            text-align: left;
            width: 978px;
        }
        .auto-style87 {
            width: 1220px;
        }
        .auto-style88 {
            width: 908px;
        }
        .auto-style89 {
            font-weight: normal;
        }
        .auto-style90 {
            width: 506px;
        }
        .auto-style91 {
            width: 506px;
            text-align: right;
        }
        .auto-style92 {
            width: 416px;
            text-align: right;
        }
        .auto-style93 {
            width: 416px;
        }

        input,
        select,
        textarea {
            max-width:710px;
        }
      
        .auto-style94 {
            width: 728px;
            font-size: small;
            text-align: right;
        }
        .auto-style95 {
            width: 934px;
            font-size: small;
            text-align: left;
        }
        .auto-style96 {
            width: 934px;
            font-size: small;
            text-align: right;
        }
        .auto-style99 {
            width: 934px;
            font-size: small;
        }
      
        </style>
        <script type ="text/javascript">
    

    function AbrirVentana(url) {

        window.open(url, '');
        return false;

    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server" >
    <%-- <div class="container">--%>
        <div class="panel panel-default" style="
    width: 1302px;
">

            <div class="panel-heading auto-style6"><strong>Edicion y/o Registro de Datos</strong></div>
            <div class="panel-body">
               
                <table class="auto-style34">
                    <tr>
                        <td class="auto-style92"><span class="auto-style5">No de Identidad:&nbsp; </span><asp:TextBox ID="txtBusqueda" runat="server" CssClass="auto-style5" Width="250px"></asp:TextBox>
                        </td>
                        <td class="auto-style51">
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="24px" ImageUrl="~/Imagenes/mag_glass.png" Width="34px" />
                        </td>
                        <td class="auto-style55">
                            <asp:Label ID="lblAdvertencia" runat="server" CssClass="auto-style5" ForeColor="Red" Text="Retornado Reincidente" Visible="False"></asp:Label>
                            <asp:Image ID="imgAdvertencia" runat="server" Height="27px" ImageUrl="~/Imagenes/Advertencia.png" Width="43px" Visible="False" />
                            <br />
                        <asp:LinkButton ID="lnkbReincidentes" runat="server" CssClass="auto-style8" Visible="False" OnClientClick="javascript:AbrirVentana('RetornadosReincidentes.aspx')">Visualizar</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style93">&nbsp;</td>
                        <td class="auto-style90">&nbsp;</td>
                        <td class="auto-style54">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style92"><span class="auto-style5">Año:&nbsp; </span><asp:TextBox ID="txtanio" runat="server" CssClass="auto-style5" Width="250px"></asp:TextBox></td>
                        <td class="auto-style91"><span class="auto-style5">Mes:&nbsp; </span><asp:DropDownList ID="ddlMes" runat="server" CssClass="auto-style17" Width="216px" Height="30px" style="font-size: small" DataSourceID="sqlMes" DataTextField="Mes" DataValueField="Id">
                </asp:DropDownList></td>
                        <td class="auto-style56"><span class="auto-style5">Semana:&nbsp; </span><asp:TextBox ID="txtSemana" runat="server" CssClass="auto-style17" Width="190px" style="font-size: small"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style93">&nbsp;</td>
                        <td class="auto-style90">&nbsp;</td>
                        <td class="auto-style54">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style92"><span class="auto-style5">Fecha Llegada:<dx:BootstrapDateEdit ID="BootstrapDateEdit1" runat="server" Width="363px">
                            <ClearButton DisplayMode="Always" />
                            </dx:BootstrapDateEdit>
                            &nbsp; </span>
                           
                        </td>
                        <td class="auto-style51"><span class="auto-style5"><asp:ImageButton ID="ibCalendario" runat="server" Height="25px" ImageUrl="~/Imagenes/calender-icon-blue-18.png" Width="35px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lugar Llegada:&nbsp;&nbsp; </span><asp:DropDownList ID="ddlLugarLlegada" runat="server" CssClass="auto-style17" Width="215px" Height="30px" style="font-size: small" DataSourceID="sqlLugarLlegada" DataTextField="LugarLlegada" DataValueField="id">
                                 <asp:ListItem Value="-1">-------------</asp:ListItem>
                            </asp:DropDownList></td>
                        <td class="auto-style56"><span class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp; Dia Llegada:&nbsp; </span><asp:DropDownList ID="ddlDiaLlegada" runat="server" CssClass="auto-style17" Width="190px" Height="30px" DataSourceID="sqldias" DataTextField="dia" DataValueField="Id" style="font-size: small; margin-left: 0;" >
                                 <asp:ListItem Value="-1">-------------</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style92">&nbsp;</td>
                        <td class="auto-style51">&nbsp;</td>
                        <td class="auto-style54">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style92">&nbsp;</td>
                        <td class="auto-style51">&nbsp;</td>
                        <td class="auto-style54">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style92"><span class="auto-style5">Pais de Procedencia: </span><asp:DropDownList ID="ddlPais" runat="server" CssClass="auto-style17" Width="250px" Height="30px" style="font-size: small" DataSourceID="sqlPaises" DataTextField="NombrePais" DataValueField="CodPais">
                                 <asp:ListItem Value="-1">-------------</asp:ListItem>
                            </asp:DropDownList></td>
                        <td class="auto-style91"><span class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp; Estado:&nbsp; </span><asp:DropDownList ID="ddlEstado" runat="server" CssClass="auto-style17" Width="215px" Height="30px" DataSourceID="sqlEstados" DataTextField="NombreEstado" DataValueField="CodEstado" style="font-size: small" AutoPostBack="True">
                                 <asp:ListItem Value="-1">-------------</asp:ListItem>
                            </asp:DropDownList></td>
                        <td class="auto-style37"><span class="auto-style5">Oficina Consular: </span><asp:DropDownList ID="ddlOficinaConsular" runat="server" CssClass="auto-style17" Width="190px" Height="30px" style="font-size: small" DataSourceID="sqlOficinasConsulares" DataTextField="NombreOficinasConsular" DataValueField="CodOficinasConsular">
                                 <asp:ListItem Value="-1">-------------</asp:ListItem>
                            </asp:DropDownList></td>
                        
                    </tr>
                    <tr>
                        <td class="auto-style92">&nbsp;</td>
                        <td class="auto-style51">&nbsp;</td>
                        <td class="auto-style54">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style92">&nbsp;</td>
                        <td class="auto-style51">&nbsp;</td>
                        <td class="auto-style54">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style92"><span class="auto-style5">Via Retorno: </span><asp:DropDownList ID="ddlViaRetorno" runat="server" CssClass="auto-style17" Width="250px" Height="30px" style="font-size: small" DataSourceID="sqlViaRetorno" DataTextField="NombreViaRetorno" DataValueField="CodViaRetorno">
                                 <asp:ListItem Value="-1">-------------</asp:ListItem>
                            </asp:DropDownList></td>
                        <td class="auto-style91"><span class="auto-style5">Tipo Deportacion: </span><asp:DropDownList ID="ddlTipoDeportacion" runat="server" CssClass="auto-style17" Width="215px" Height="30px" style="font-size: small" DataSourceID="sqlTipoDeportacion" DataTextField="NombreTipoDeportacion" DataValueField="CodTipoDeportacion">
                                 <asp:ListItem Value="-1">-------------</asp:ListItem>
                            </asp:DropDownList></td>
                        <td class="auto-style54">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style92">&nbsp;</td>
                        <td class="auto-style91">&nbsp;</td>
                        <td class="auto-style54">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style92">&nbsp;</td>
                        <td class="auto-style91">&nbsp;</td>
                        <td class="auto-style54">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style37" colspan="3"> &nbsp;</td>
                    </tr>
                    </table>
                <table class="auto-style34">
                    <tr>
                        <td colspan="3" class="Izquierda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style5"> </span><span class="auto-style89"><strong><span class="auto-style5">Nombre Completo: </span> &nbsp;</strong></span><asp:TextBox ID="txtNombreCompleto" runat="server" Height="30px" Style="font-size: small" Width="720px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style68">&nbsp;</td>
                        <td class="auto-style66">&nbsp;</td>
                        <td class="auto-style69">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style70">&nbsp;</td>
                    
                        <td class="auto-style95">&nbsp;</td>
                        
                    
                        <td class="auto-style67">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style70"><span class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Departamento: </span><asp:DropDownList ID="ddlDepartamento" runat="server" CssClass="auto-style17" Width="250px" AutoPostBack="True" DataSourceID="sqlDeptos" DataTextField="NombreDepartamento" DataValueField="CodDepartamento" style="font-size: small" Height="30px">
                                 <asp:ListItem Value="-1">-------------</asp:ListItem>
                            </asp:DropDownList></td>
                    
                        <td class="auto-style96"><span class="auto-style5">&nbsp;&nbsp;&nbsp; Municipio: </span><asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="auto-style17" Width="226px" DataSourceID="sqlMunicipios" DataTextField="NombreMunicipio" DataValueField="CodMunicipio" Height="30px">
                                 <asp:ListItem Value="-1">-------------</asp:ListItem>
                            </asp:DropDownList></td>
                        
                    
                        <td class="auto-style94">Fecha Nacimiento:&nbsp; <asp:TextBox ID="txtFecNac" runat="server" CssClass="auto-style17" Width="154px" style="font-size: small"></asp:TextBox>
                            
                            <span class="auto-style5"><asp:ImageButton ID="ibCalendarioNac" runat="server" Height="25px" ImageUrl="~/Imagenes/calender-icon-blue-18.png" Width="35px" />
                            </span>
                            
                            <asp:Calendar ID="Calendar2" runat="server" CssClass="auto-style46"></asp:Calendar></td>
                        <td class="Izquierda">
                            
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style70">&nbsp;</td>
                    
                        <td class="auto-style95">&nbsp;</td>
                        <td class="auto-style69">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style70">&nbsp;</td>
                    
                        <td class="auto-style95">&nbsp;</td>
                        <td class="auto-style69">&nbsp;</td>
                    </tr>
                    <tr>
                       
                    
                        <td class="auto-style70">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Edad: <asp:TextBox ID="txtEdad" runat="server" CssClass="auto-style17" Width="134px" style="font-size: small"></asp:TextBox></td>
                        <td class="auto-style95">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Adulto/NNA: <asp:TextBox ID="txtAdultoNNA" runat="server" CssClass="auto-style17" Width="134px" style="font-size: small"></asp:TextBox></td>
                        <td class="auto-style70">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Genero: <asp:DropDownList ID="ddlGenero" runat="server" CssClass="auto-style17" Width="134px" Height="30px" DataSourceID="sqlGeneros" DataTextField="NombreGenero" DataValueField="CodGenero">
                                 <asp:ListItem Value="-1">-------------</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style70">&nbsp;</td>
                    
                        <td class="auto-style95">&nbsp;</td>
                        <td class="auto-style69">&nbsp;</td>
                    </tr>
                    <tr>
                        
                    
                        
                        <td class="auto-style99">Viaja Solo o Acompañado:<asp:DropDownList ID="ddlViajaSolo" runat="server" CssClass="auto-style17" Width="134px" Height="30px" DataSourceID="sqlViajaSolo" DataTextField="Descripion" DataValueField="Id">
                                 <asp:ListItem Value="-1">-------------</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style73"></td>
                    
                        <td class="auto-style74"></td>
                        <td class="auto-style75"></td>
                    </tr>
                    <tr>
                        <td class="auto-style70">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Unidad Familiar: <asp:TextBox ID="txtAdultoNNA0" runat="server" CssClass="auto-style17" Width="40px" Height="30px" style="font-size: small"></asp:TextBox></td>
                    
                        <td class="auto-style95">No de Personas Acompañan al Menor: <asp:TextBox ID="txtAdultoNNA1" runat="server" CssClass="auto-style17" Width="48px" Height="30px" style="font-size: small"></asp:TextBox></td>
                        <td class="auto-style77">Parentesco: <asp:DropDownList ID="ddlParentesco" runat="server" CssClass="auto-style17" Width="134px" Height="30px" DataSourceID="sqlParentescos" DataTextField="NombreParentesco" DataValueField="CodParentesco">
                                 <asp:ListItem Value="-1">-------------</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style70">&nbsp;</td>
                    
                        <td class="auto-style95">&nbsp;</td>
                        <td class="auto-style77">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style70">&nbsp;</td>
                    
                        <td class="auto-style95">&nbsp;</td>
                        <td class="auto-style72">&nbsp;</td>
                    </tr>
                   
                    </table>
                <table class="auto-style34">
                    <tr>
                        <td class="auto-style57" colspan="2"><span class="auto-style5">Nombre Acompanante:&nbsp; <asp:TextBox ID="txtNombreAcompanante" runat="server" CssClass="auto-style17" Width="456px" style="font-size: small"></asp:TextBox></span></td>
                        <td class="auto-style84">Numero de Identidad: <asp:TextBox ID="txtBusqueda0" runat="server" CssClass="auto-style5" Width="233px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style79">&nbsp;</td>
                        <td class="auto-style88">&nbsp;</td>
                        <td class="auto-style87">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style80"><span class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Departamento: </span><asp:DropDownList ID="ddlDepartamentoAdulto" runat="server" CssClass="auto-style17" Width="211px" AutoPostBack="True" DataSourceID="sqlDeptos" DataTextField="NombreDepartamento" DataValueField="CodDepartamento" style="font-size: small" Height="30px">
                                 <asp:ListItem Value="-1">-------------</asp:ListItem>
                            </asp:DropDownList></td>
                    
                        <td class="auto-style81"><span class="auto-style5">Municipio: </span><asp:DropDownList ID="ddlMunicipioAdulto" runat="server" CssClass="auto-style17" Width="226px" DataSourceID="sqlMunicipios0" DataTextField="NombreMunicipio" DataValueField="CodMunicipio" Height="30px">
                                 <asp:ListItem Value="-1">-------------</asp:ListItem>
                            </asp:DropDownList></td>
                        
                    
                        <td class="auto-style84">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="Izquierda">
                            
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style79">&nbsp;</td>
                        <td class="auto-style88">&nbsp;</td>
                        <td class="auto-style87">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style80">Fecha Nacimiento:&nbsp; <asp:TextBox ID="txtFecNacAdulto" runat="server" CssClass="auto-style17" Width="154px" style="font-size: small"></asp:TextBox>
                            
                            <span class="auto-style5"><asp:ImageButton ID="ibCalendarioAdulto" runat="server" Height="25px" ImageUrl="~/Imagenes/calender-icon-blue-18.png" Width="35px" />
                            </span>
                            
                            <asp:Calendar ID="Calendar3" runat="server" CssClass="auto-style46"></asp:Calendar></td>
                    
                        <td class="auto-style82">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Edad: <asp:TextBox ID="txtEdad0" runat="server" CssClass="auto-style17" Width="134px" style="font-size: small"></asp:TextBox></td>
                        <td class="auto-style84">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Genero: <asp:DropDownList ID="ddlGeneroAdulto" runat="server" CssClass="auto-style17" Width="134px" Height="30px">
                                 <asp:ListItem Value="-1">-------------</asp:ListItem>
                            </asp:DropDownList></td>
                        <td class="auto-style85">&nbsp;</td>
                        <td class="Izquierda">
                            
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style79">&nbsp;</td>
                        <td class="auto-style88">&nbsp;</td>
                        <td class="auto-style87">&nbsp;</td>
                    </tr>
                    </table>
                   
                <br />
                <span class="auto-style5"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Delito: </strong></span>:<asp:TextBox ID="txtDelito" runat="server"  Width="755px" CssClass="inline" style="font-size: small"></asp:TextBox>
                <br />
                <br />
                <span class="auto-style5"><strong>Condicion Medica: </strong></span>:<asp:TextBox ID="txtCondicionMedica" runat="server"  Width="755px" CssClass="inline" style="font-size: small"></asp:TextBox>
                <br />
                   
                <table>
                    <tr>
                        
                        <td class="auto-style86">
                           
                        </td>
                        <td>
                            &nbsp;</td>
                        <td class="auto-style87">
                             <asp:Button ID="btnInsertar" runat="server" class="btn-info auto-style5" Height="26px" Text="Guardar Datos" Width="105px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnActualizar" runat="server" class="btn-info auto-style5" Height="26px" Text="Editar Datos" Width="105px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnEliminar" runat="server" class="btn-info auto-style5" Height="26px" Text="Eliminar Datos" Width="105px" />

                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:SqlDataSource ID="sqlDeptos" runat="server" ConnectionString="<%$ ConnectionStrings:SqlServices %>" SelectCommand="Select 0 as CodDepartamento,'---------------' as NombreDepartamento 

union SELECT [CodDepartamento]
      ,[NombreDepartamento]
     
  FROM [dbo].[Departamentos]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sqlMunicipios" runat="server" ConnectionString="<%$ ConnectionStrings:SqlServices %>" SelectCommand="Select 0 CodMunicipio,'---------------' NombreMunicipio

union

SELECT [CodMunicipio]
      ,[NombreMunicipio]
      
  FROM [dbo].[Municipios] where CodDepartamento=@depto">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlDepartamento" Name="depto" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sqldias" runat="server" ConnectionString="<%$ ConnectionStrings:SqlServices %>" SelectCommand="Select 0 as Id, '---------------' as dia
union

SELECT  [Id]
      ,[Dia]
  FROM [dbo].[Dia]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sqlEstados" runat="server" ConnectionString="<%$ ConnectionStrings:SqlServices %>" SelectCommand="Select 0 as [CodEstado], '---------------' as [NombreEstado]
union

SELECT [CodEstado]
      ,[NombreEstado]
FROM [dbo].[Estados]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="sqlGeneros" runat="server" ConnectionString='<%$ ConnectionStrings:SqlServices %>' SelectCommand="Select 0 as CodGenero,
'---------------' as NombreGenero
union
SELECT [CodGenero]
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
                <asp:SqlDataSource ID="sqlOficinasConsulares" runat="server" ConnectionString='<%$ ConnectionStrings:SqlServices %>' SelectCommand="Select 0 as CodOficinasConsular,
'---------------' as NombreOficinasConsular
union
SELECT[CodOficinasConsular]
      ,[NombreOficinasConsular]
FROM [dbo].[OficinasConsulares] where CodEstado=@Estado">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlEstado" PropertyName="SelectedValue" Name="Estado"></asp:ControlParameter>
                    </SelectParameters>
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
                <asp:SqlDataSource runat="server" ID="sqlViajaSolo" ConnectionString='<%$ ConnectionStrings:SqlServices %>' SelectCommand="Select 0 as Id,'---------------' as Descripion
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
                <asp:SqlDataSource runat="server" ID="sqlMes" ConnectionString='<%$ ConnectionStrings:SqlServices %>' SelectCommand="Select 0 as Id,'---------------' as Mes
union
SELECT [Id],[Mes]
FROM [dbo].[Meses]">

                </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sqlMunicipios0" runat="server" ConnectionString="<%$ ConnectionStrings:SqlServices %>" SelectCommand="Select 0 CodMunicipio,'---------------' NombreMunicipio

union

SELECT [CodMunicipio]
      ,[NombreMunicipio]
      
  FROM [dbo].[Municipios] where CodDepartamento=@depto">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlDepartamentoAdulto" Name="depto" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                 
    </div>
    </div>
   <%-- </div>--%>
   
</asp:Content>


