<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="CatalogoWeb.Favoritos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

         <h1 class="texto">Tus Favoritos</h1>

 <div class="row row-cols-1 row-cols-md3 g-4">
     <asp:Repeater runat="server" ID="repRepetidor">
         <ItemTemplate>
             <div class="card">
                 <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="..." />
                 <div class="card-body">
                     <h5 class="card.title texto"><%#Eval("Nombre") %></h5>
                     <p class="card-text"><%#Eval("Descripcion") %></p>
                 </div>
             </div>
         </ItemTemplate>
     </asp:Repeater>

 </div>

</asp:Content>
