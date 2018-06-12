<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Sistemas.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="num_orden" DataSourceID="SqlDataSource1" DefaultMode="Insert">
        <InsertItemTemplate>
            <div class="container">
                <div class="row">
                    <div class="col s12">
                        <div class="row">
                            <div class="input-field col s12">
                                <asp:TextBox ID="num_ordenTextBox" runat="server" Text='<%# Bind("num_orden") %>' />
                                <label for="num_ordenTextBox">Numero de orden</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s11">
                                <asp:TextBox ID="rut_clienteTextBox" runat="server" Text='<%# Bind("rut_cliente") %>' />
                                <label for="rut_clienteTextBox">Rut del cliente</label>
                            </div>
                            <div class="input-field col s1">
                                <asp:Button ID="search" runat="server" CssClass="waves-effect waves-light btn-small" Text="Buscar"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <asp:TextBox ID="equipoTextBox" runat="server" Text='<%# Bind("equipo") %>' />
                                <label for="equipoTextBox">Equipo</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <asp:TextBox ID="modeloTextBox" runat="server" Text='<%# Bind("modelo") %>' />
                                <label for="modeloTextBox">Modelo</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <asp:TextBox ID="serieTextBox" runat="server" Text='<%# Bind("serie") %>' />
                                <label for="serieTextBox">Numero de serie</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <asp:TextBox ID="descripcionTextBox" runat="server" TextMode="MultiLine" CssClass="materialize-textarea" Text='<%# Bind("descripcion") %>' />
                                <label for="descripcionTextBox">Descripcion</label>
                            </div>
                        </div>s
                        <div class="row">
                            <div class="input-field col s12">
                                <asp:TextBox ID="tipoTextBox" runat="server" Text='<%# Bind("tipo") %>' />
                                <label for="tipoTextBox">Tipo</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <asp:Button  ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Ingresar Orden" CssClass="waves-effect waves-light btn-large"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </InsertItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sistemasConnectionString %>" InsertCommand="INSERT INTO [ordenes] ([num_orden], [rut_cliente], [equipo], [modelo], [serie], [descripcion], [tipo]) VALUES (@num_orden, @rut_cliente, @equipo, @modelo, @serie, @descripcion, @tipo)" >
        <InsertParameters>
            <asp:Parameter Name="num_orden" Type="Int32" />
            <asp:Parameter Name="rut_cliente" Type="String" />
            <asp:Parameter Name="equipo" Type="String" />
            <asp:Parameter Name="modelo" Type="String" />
            <asp:Parameter Name="serie" Type="String" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="tipo" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
