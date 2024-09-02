<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="CatalogoWeb.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >

    <h1 class="texto">Hubo un problema</h1>
    <asp:Label Text="text" id="lblMensaje" runat="server" CssClass="texto" />
    <div class="row">
        <div class="mb-3">
             <a href="Login.aspx" class="btn btn-outline-secondary texto">Registrarse</a>
        </div>
    </div>
   
</asp:Content>
