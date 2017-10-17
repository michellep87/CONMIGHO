<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="CargarExcel.aspx.vb" Inherits="Carga_CargarExcel" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
      <%--Paginador...--%>
      <style type="text/css">
          .auto-style5 {
              font-size: 1.1em;
              display: block;
              text-align: right;
              padding: 10px;
              color: #666666;
              height: 52px;
              width: 266px;
          }
          .auto-style6 {
              text-align: center;
              font-size: small;
              width: 644px;
              height: 20px;
          }
          .auto-style8 {
              font-size: small;
          }
          .auto-style9 {
              text-align: right;
              font-size: small;
              width: 644px;
          }
          .auto-style10 {
              width: 1300px;
          }
          .auto-style11 {
              width: 335px;
              height: 20px;
          }
          .auto-style12 {
              text-align: left;
              width: 335px;
          }
          .auto-style13 {
              width: 98%;
          }
          .auto-style14 {
              text-align: right;
              width: 412px;
          }
          .auto-style15 {
              width: 412px;
          }
          .auto-style16 {
              text-align: left;
              width: 421px;
          }
          .auto-style18 {
              text-align: right;
              width: 412px;
              height: 27px;
          }
          .auto-style19 {
              text-align: left;
              width: 421px;
              height: 27px;
          }
          .auto-style20 {
              height: 27px;
          }
          .auto-style21 {
              width: 421px;
          }
          .auto-style22 {
              text-align: left;
              font-size: small;
              width: 644px;
          }
          .auto-style24 {
              text-align: right;
              width: 644px;
          }
          .auto-style26 {
              font-size: small;
              text-align: right;
          }
          .auto-style27 {
              width: 1250px;
              height: auto;
          }
          .auto-style28 {
              font-size: medium;
          }
      </style>
    <script type ="text/javascript">
    var validFilesTypes=["xlsx","xls"];
    function ValidateFile()
    {
      var file = document.getElementById("FileUpload1");
      var label = document.getElementById("Label1");
      var path = file.value;
      var ext=path.substring(path.lastIndexOf(".")+1,path.length).toLowerCase();
      var isValidFile = false;
      for (var i=0; i<validFilesTypes.length; i++)
      {
        if (ext==validFilesTypes[i])
        {
            isValidFile=true;
            break;
        }
      }
      if (!isValidFile)
      {
        label.style.color="red";
        label.innerHTML="Archivo Invalido. Por Favor cargue un archivo con las extensiones" +
         " extension:\n\n"+validFilesTypes.join(", ");
      }
      return isValidFile;
    }

    function AbrirVentana(url) {

        window.open(url, '');
        return false;

    }
</script>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="MainContent">
     <table class="auto-style10">
        <tr>
            <td class="auto-style24">
                <asp:Label ID="Label1" runat="server" Text="Seleccione el Archivo de Carga:" CssClass="auto-style8"></asp:Label>
            &nbsp;&nbsp;
            </td>
            <td class="auto-style12">
                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="auto-style8" ValidateRequestMode="Enabled" ValidationGroup="Carga" EnableTheming="True" />
                                <strong>
                    <dx:ASPxLabel ID="lblArchivo" runat="server" Text="ASPxLabel" Visible="False" CssClass="auto-style28" ForeColor="#33CC33">
                    </dx:ASPxLabel>
                                </strong>
                <br />
                </td>
            <td>&nbsp;</td>
        </tr>
       
        <tr>
            <td class="auto-style6"></td>
            <td class="auto-style11"></td>
            <td></td>
        </tr>
         <tr>
            <td class="auto-style22">
               
                
                    <dx:ASPxButton ID="btnImportar" runat="server" Text="Importar" Theme="DevEx">
                        <Image IconID="arrows_moveup_16x16">
                        </Image>
                    </dx:ASPxButton>
                
             </td>
            <td class="auto-style12">
                &nbsp;</td>
             <td class="auto-style26"> <a href="../Formato%20de%20Carga.xlsx">Descargar Formato de Carga</a></td>
        </tr>
          <tr>
            <td class="hidden">
                <asp:Label ID="Label2" runat="server" Text="Ingrese el Nombre de la Hoja a Cargar:" CssClass="auto-style8" Visible="False"></asp:Label>
            </td>
            <td class="hidden">
                <asp:TextBox ID="txtNombreHoja" runat="server" ValidateRequestMode="Enabled" ValidationGroup="Carga" CssClass="auto-style8" ReadOnly="True" Visible="False" Height="23px" Width="128px">Hoja1</asp:TextBox>
                <asp:requiredfieldvalidator id="RequiredFieldValidator3"
                  controltovalidate="txtNombreHoja"
                  validationgroup="Carga"
                  errormessage ="*Ingrese un Nombre de Hoja Valido."
                  
                  runat="Server" ForeColor="Red" CssClass="auto-style8"></asp:requiredfieldvalidator>
                 
               
            </td>
               
                
            <td class="hidden"></td>
               
                
        </tr>
         <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style12">
                &nbsp;</td>
        </tr>
    </table>
    &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:Image ID="Image1" runat="server" Height="315px" ImageUrl="~/Imagenes/logo.png" Width="518px" />
     <br />
     <div style="overflow-x:auto;overflow-y: auto" class="auto-style27" >
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<dx:ASPxGridView ID="GridView1" runat="server" Theme="DevEx" Visible="False">
         </dx:ASPxGridView>
&nbsp;<asp:GridView ID="gv" runat="server" 
        AutoGenerateColumns="True" 
        CssClass="table table-bordered bs-table" 
        OnRowDeleted="GridView1_RowDeleted"
        OnRowUpdated="GridView1_RowUpdated"
        OnRowEditing="GridView1_RowEditing"
        OnDataBound="GridView1_DataBound"
        allowpaging="false" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" style="font-size: small" Visible="False">
 
       <%--Paginador...--%>        
             <%--   <pagertemplate>
        <div class="row" style="margin-top:20px;">
            <div class="col-lg-1" style="text-align:right;">
                <h5><asp:label id="MessageLabel" text="Ir a la pág." runat="server" /></h5>
            </div>
             <div class="col-lg-1" style="text-align:left;">
                <asp:dropdownlist id="PageDropDownList" Width="50px" autopostback="true" onselectedindexchanged="PageDropDownList_SelectedIndexChanged" runat="server" CssClass="form-control" /></h3>
            </div>
            <div class="col-lg-10" style="text-align:right;">
                <h3><asp:label id="CurrentPageLabel" runat="server" CssClass="label label-warning" /></h3>
            </div>
        </div>        
        </pagertemplate>     --%><Columns>
             
           
            
           
        </Columns>
        <PagerSettings FirstPageText="First" LastPageImageUrl="Last" />
        <EditRowStyle BackColor="#ffffcc" />
        <EmptyDataRowStyle forecolor="Red" CssClass="table table-bordered" />
        <emptydatatemplate>
            ¡No Registros!  
        </emptydatatemplate>           
 
        <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
        <PagerSettings PageButtonCount="4" FirstPageText="First" LastPageText="Last"/>  
    </asp:GridView>
        </div>

    <br />

    <table class="auto-style13">
        <tr>
            <td class="auto-style14">
                <asp:Label ID="lblcarga" runat="server" CssClass="auto-style8" Text="Carga Exitosa!!!" Visible="False" ForeColor="#33CC33"></asp:Label>
            </td>
            <td class="auto-style16">&nbsp;</td>
            <td class="Izquierda">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style14">
                <asp:Label ID="lblDetalle" runat="server" CssClass="auto-style8" Text="Detalle de la Carga:" Visible="False"></asp:Label>
            </td>
            <td class="auto-style16">&nbsp;</td>
            <td class="Izquierda">
                <asp:Button ID="btnValidar" runat="server" Text="Validar Carga" ValidationGroup="Carga"  CssClass="auto-style8" Visible="False" Width="100px" />
                </td>
        </tr>
        <tr>
            <td class="auto-style14">
                <asp:Label ID="lblCargados" runat="server" CssClass="auto-style8" Text="Registros Cargados" Visible="False"></asp:Label>
            </td>
            <td class="auto-style16">
                <asp:TextBox ID="txtCargados" runat="server" CssClass="auto-style8" Visible="False"></asp:TextBox>
            </td>
            <td class="Izquierda">
                <asp:Button ID="btnSubirArchivo" runat="server" CssClass="auto-style8" Text="Subir Carga" Width="100px"  Visible="False" />
            </td>
        </tr>
        <tr>
            <td class="auto-style18">
                <asp:Label ID="lblCorrectos" runat="server" Text="Registros Correctos:" Visible="False" CssClass="auto-style8"></asp:Label>
             </td>
            <td class="auto-style19">
                <asp:TextBox ID="txtcorrectos" runat="server" ValidateRequestMode="Enabled" ValidationGroup="Carga" CssClass="auto-style8" Visible="False"></asp:TextBox>
                <asp:LinkButton ID="lnkbCorrectos" runat="server" CssClass="auto-style8"  Visible="False">Visualizar</asp:LinkButton>
            </td>
            <td class="auto-style20"></td>
        </tr>
        <tr>
            <td class="auto-style14"><asp:Label ID="lblErrores" runat="server" Text="Registros Erroneos:" Visible="False" CssClass="auto-style8"></asp:Label></td>
            <td class="auto-style16">
                <asp:TextBox ID="txtErrores" runat="server" ValidateRequestMode="Enabled" ValidationGroup="Carga" CssClass="auto-style8" Visible="False"></asp:TextBox>
                <asp:LinkButton ID="lnkbErrores" runat="server" CssClass="auto-style8"  Visible="False" >Visualizar</asp:LinkButton>
         <%--       <a href="~/Carga/GridErroneos.aspx" id="lnkbErrores" target="_blank">Visualizar</a>--%>
            </td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SqlServices %>" SelectCommand="SELECT [Idcarga] as Id
      ,[Anio] as 'Año'
      ,[Mes] 
      ,[Semana]
      ,[FechaLlegada] as 'Fecha Llegada'
      ,[LugarLlegada] as 'Lugar Llegada'
      ,[PaisProcedencia] as 'Pais Procedencia'
      ,[Estado] 
      ,[OficinaConsular] as 'Oficina Consular'
      ,[ViaRetorno] as 'Via Retorno'
      ,[TipoDeportacion] as 'Tipo Deportacion'
      ,[NombreCompleto] as 'Nombre Completo'
      ,[NumIdentidad1] 
      ,[NumIdentidad2]
      ,[NumIdentidad3]
      ,[DiaNacimiento] as 'Dia Nacimiento'
      ,[MesNacimiento] as 'Mes Nacimiento'
      ,[AnioNacimiento] as 'Año Nacimiento'
      ,[Sexo]
      ,[ViajaSoloAcompaniado] as 'Viaja Solo o Acompañado'
      ,[NumeroPersonasAcompanian] as 'Numero de Personas que Acompañan'
      ,[Parentesco]
      ,[NombreAcompanante] as 'Nombre Acompañante'
      ,[NumIdentidadAcompanante1]
      ,[NumIdentidadAcompanante2]
      ,[NumIdentidadAcompanante3]
      ,[DiaNacimientoAcompanante] as 'Dia Nacimiento Acompañante'
      ,[MesNacimientoAcompanante] as 'Mes Nacimiento Acompañante'
      ,[AnioNacimientoAcompanante] as 'Año Nacimiento Acompañante'
      ,[SexoAcompanante] as 'Sexo Acompañante'
      ,[Delito]
      ,[CondicionMedica]
  FROM [dbo].[Cargas]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style21">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>


