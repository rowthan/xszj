<%@ Page Title="" Language="C#" MasterPageFile="~/Do/MasterPage2.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Do_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>test</title>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  


    <asp:GridView ID="GridView2" runat="server" DataSourceID="ObjectDataSource1" EnableModelValidation="True" AllowPaging="True" AllowSorting="True"></asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDataSet" TypeName="conn">
        <SelectParameters>
            <asp:QueryStringParameter Name="strSql" QueryStringField="select * from staffinfo" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

</asp:Content>

