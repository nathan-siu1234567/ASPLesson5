<%@ Page Title="Students" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="COMP2007_S2016_Template21.Students" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-md-8">
                <h1>Student List</h1>
                <a href="StudentDetails.aspx" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add Student</a>
                <div>
                    <label>Records Per Page: </label>
                    <asp:DropDownList runat="server" ID="DropDownList" AutoPostBack="true" CssClass="btn btn-default btn-sm dropdown-toggle"
                        OnSelectedIndexChanged="DropDownList_SelectedIndexChanged">
                       
                        <asp:ListItem  Text="3" Value="3"/>
                            
                        <asp:ListItem  Text="5" Value="5"/>
                        <asp:ListItem  Text="ALL" Value="10000"/>
                    </asp:DropDownList>
                </div>
                <asp:GridView runat="server" CssClass="table table-bordered table-striped table-hover" 
                    ID="StudentsGridView" AutoGenerateColumns="false" OnRowDeleting="StudentsGridView_RowDeleting" DataKeyNames="StudentID" AllowPaging="true" PageSize="5" OnPageIndexChanging="StudentsGridView_PageIndexChanging"
                    AllowSorting="true" OnSorting="StudentsGridView_Sorting" OnRowDataBound="StudentsGridView_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="StudentID" HeaderText="Student ID" Visible="true" SortExpression="StudentID" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" Visible="true" SortExpression="LastName"/>
                        <asp:BoundField DataField="FirstMidName" HeaderText="First Name" Visible="true" SortExpression="FirstMidName" />
                        <asp:BoundField DataField="EnrollmentDate" HeaderText="Enrollment Date" Visible="true"
                            DataFormatString="{0:MMM dd, yyyy}" SortExpression="EnrollmentDate" />
                        <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> Edit'" NavigateUrl="~/Students.aspx" ItemStyle-CssClass="btn btn-primary btn-sm" DataNavigateUrlFormatString="StudentDetails.aspx?StudentID=(0)" ControlStyle-ForeColor="White" ItemStyle-VerticalAlign="Middle" />
                        <asp:CommandField HeaderText="Delete" DeleteText="<i class='fa fa-trash-o fa-lg'></i>'Delete" ShowDeleteButton="true" ButtonType="Link" ControlStyle-CssClass="btn btn-danger btn-sm" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>




</asp:Content>
