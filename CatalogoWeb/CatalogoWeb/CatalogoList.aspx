<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CatalogoList.aspx.cs" Inherits="CatalogoWeb.CatalogoList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h1 class="texto">Lista de Catalogo</h1>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-6">
                    <div clas="mb-3">
                        <asp:Label Text="Filtrar" runat="server" CssClass="texto" />
                        <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="filtro_TextChanged" />
                    </div>
                </div>
                <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
                    <div class="mb-3">
                        <asp:CheckBox Text="Filtro Avanzado"
                            CssClass="texto" ID="chkAvanzado" runat="server" AutoPostBack="true"
                            OnCheckedChanged="chkAvanzado_CheckedChanged" />
                    </div>
                </div>
                <%if (FiltroAvanzado)
                    { %>
                <div class="row">
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Campo" ID="lblCampo" runat="server" CssClass="texto" />
                            <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control" ID="ddlCampo" OnSelectedIndexChanged="dllCampo_SelectedIndexChanged">
                                <asp:ListItem Text="" />
                                <asp:ListItem Text="Nombre" />
                                <asp:ListItem Text="Artículo" />
                                <asp:ListItem Text="Precio" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Criterio" runat="server" CssClass="texto" />
                            <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Filtro" runat="server" CssClass="texto" />
                            <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Button Text="Buscar" runat="server" CssClass="btn btn-secondary texto" ID="btnBuscar" OnClick="btnBuscar_Click" />
                            <a href="CatalogoList.aspx" class="btn btn-secondary texto">Volver</a>
                        </div>
                    </div>
                </div>
                <%} %>
            </div>
            <asp:GridView ID="dgvCatalogo" runat="server" DataKeyNames="Id"
                CssClass="table" AutoGenerateColumns="false"
                OnSelectedIndexChanged="dgvCatalogo_SelectedIndexChanged"
                OnPageIndexChan=""
                ging="dgvCatalogo_PageIndexChanging" 
                AllowPaging="true" PageSize="5" >
                <Columns>
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" />
                    <asp:BoundField HeaderText="Articulo" DataField="Articulos.Descripcion" />
                    <asp:BoundField HeaderText="Marca" DataField="Marcas.Descripcion" />
                    <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="🛎️Ver" />
                </Columns>
            </asp:GridView>
           <%-- <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link">Anterior</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Siguiente</a>
                </li>--%>
            </ul>
            <a href="FormularioCatalogo.aspx" class="btn btn-secondary texto">Agregar</a>
            <a href="Default.aspx" class="btn btn-secondary texto">Volver</a>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
