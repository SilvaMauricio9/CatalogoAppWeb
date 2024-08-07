<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="CatalogoWeb.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="texto">Mi Perfil</h1>
    <div class="row">
        <div class="col-md-4">
            <div class="mb-3">
                <label class="form-label texto">Email</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" />
            </div>
            <div class="mb-3">
                <label class="form-label texto">Nombre</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtNombre" />
            </div>
            <div>
                <label class="form-label texto">Apellido</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtApellido" />
            </div>
            <div>
                <label class="form-label texto">Fecha de Nacimiento</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtFechaNacimiento" TextMode="Date" />
            </div>
        </div>
        <div class="col-md-4">
            <div class="mb-3">
                <label class="form-label texto">Imagen Perfil</label>
                <input type="file" id="txtImagen" runat="server" class="form-control texto" />
            </div>
            <asp:Image ID="imgNuevoPerfil" ImageUrl="https://t4.ftcdn.net/jpg/05/17/53/57/360_F_517535712_q7f9QC9X6TQxWi6xYZZbMmw5cnLMr279.jpg" runat="server" CssClass="img-fluid mb-3" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <asp:Button Text="Guardar" CssClass="btn btn-secondary texto" OnClick="btnGuardar_Click" ID="btnGuardar" runat="server" />
            <a href="/" class="btn btn-secondary texto">Regresar</a>

        </div>

    </div>

</asp:Content>
