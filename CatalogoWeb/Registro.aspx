<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="CatalogoWeb.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-4">
            <h2 class="texto">Creá tu perfil Treinee</h2>
            <div class="mb-3">
                <label class="form-label texto">Email</label>
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label class="form-label texto" >Password</label>
                <asp:TextBox runat="server" ID="txtPass" CssClass="form-control" TextMode="Password" />
            </div>
            <asp:Button Text="Registrarse" runat="server" CssClass="btn btn-outline-secondary texto" ID="btnRegistro" OnClick="btnRegistro_Click" />
            <a href="/" class=" btn btn-secondary texto">Cancelar</a>
        </div>
    </div>
</asp:Content>
