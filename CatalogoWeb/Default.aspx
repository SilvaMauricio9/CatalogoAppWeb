<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CatalogoWeb.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .texto {
            font-family: fantasy
        }
    </style>
    <h3 class="texto">Bienvenido</h3>
    <p class="texto">Llegaste al Catalogo Web</p>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <asp:Repeater ID="repRepetidor" runat="server">
            <ItemTemplate>
                <div class="col">
                    <div class="card">
                        <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title texto"><%#Eval("Nombre") %></h5>
                            <p class="card-text"><%#Eval("Descripcion") %></p>
                            <a href="DetalleArticulo.aspx?id=<%#Eval("Id") %>" class="btn btn-outline-secondary texto">🔎</a>
                            <a href="Carrito.aspx?id=<%#Eval("Id") %>" class="btn btn-outline-secondary texto">🛒</a>
                            <asp:Button Text="♥️" ID="btnFavorito" runat="server" CssClass="btn btn-outline-secondary" CommandArgument='<%#Eval("Id") %>' CommandName="FavoritoId" OnClick="btnFavorito_Click1" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
