<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="CatalogoWeb.DetalleArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .oculto {
            display: none;
        }
    </style>

    <asp:ScriptManager ID="ScriptManager" runat="server" />

    <div class="row">
        <div class="col-6">
            <div clas="mb-3">
                <label for="txtId" class="form-label texto oculto">Id</label>
                <asp:TextBox runat="server" ID="txtId" CssClass="form-control oculto" />
            </div>
            <div clas="mb-3">
                <label for="txtNombre" class="form-label texto">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
            </div>
            <div clas="mb-3">
                <label for="txtCodigo" class="form-label texto">Código</label>
                <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" />
            </div>
            <div clas="mb-3">
                <label for="ddlArticulo" class="form-label texto">Articulo</label>
                <asp:DropDownList ID="ddlArticulo" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
            <div clas="mb-3">
                <label for="ddlMarca" class="form-label texto">Marca</label>
                <asp:DropDownList ID="ddlMarca" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
            </div>
            <div clas="mb-3">
                <label for="txtDescripcion" class="form-label texto">Descripción</label>
                <asp:TextBox runat="server" TextMode="MultiLine" ID="txtDescripcion" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtPrecio" class="form-label texto">Precio</label>
                <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtUrlImagen" class="form-label texto oculto">Url Imagen</label>
                <asp:TextBox runat="server" ID="txtUrlImagen" CssClass="form-control oculto"
                    AutoPostBack="true" OnTextChanged="txtUrlImagen_TextChanged" />
            </div>
        </div>
        <div class="col-6">

            <asp:UpdatePanel ID="UpdatePanelImgFav" runat="server">
                <ContentTemplate>
                    <asp:Image ImageUrl="https://www.peacemakersnetwork.org/wp-content/uploads/2019/09/placeholder.jpg"
                        runat="server" ID="imgCatalogo" Width="100%" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="row">
        <div class="col-6">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-secondary texto" runat="server" />
                        <a href="CatalogoList.aspx" class="btn btn-secondary texto">Cancelar</a>
                        <asp:Button Text="Eliminar" ID="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-outline-danger texto" runat="server" />
                    </div>

                    <%if (ConfirmaEliminacion)
                        { %>
                    <div class="mb-3">
                        <asp:CheckBox Text="Confirmar Eliminación" ID="chkConfirmaEliminacion" runat="server" />
                        <asp:Button Text="Eliminar Favorito" ID="btnConEliminacionFavorito" OnClick="btnConfirmaEliminar_Click" CssClass="btn btn-outline-danger" runat="server" />
                    </div>
                    <%} %>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>

</asp:Content>
