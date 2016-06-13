<%@ Page Title="Departments" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Departments.aspx.cs" Inherits="COMP2007_S2016_Template21.Departments" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-md-8">
                <h1>Departments</h1>
            </div>
            <asp:GridView runat="server" CssClass="table table-bordered table-striped table-hover" ID="DepartmentsGridView" AutoGenerateColumns="false" OnRowDeleting="DepartmentsGridView_RowDeleting" AllowSorting="true" OnSorting="DepartmentsGridView_Sorting" OnRowDataBound="DepartmentsGridView_RowDataBound"

                </asp:GridView>
        </div>
    </div>
</asp:Content>
