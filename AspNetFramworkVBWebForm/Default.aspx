<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="AspNetFramworkVBWebForm._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">ASP.NET</h1>
            <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
            <p><a href="http://www.asp.net" class="btn btn-primary btn-md">Learn more &raquo;</a></p>
        </section>

        <div class="row">
            <section class="col-md-4" aria-labelledby="gettingStartedTitle">
                <h2 id="gettingStartedTitle">Testing WCF Calls</h2>
                <p>
                    Simple call to WCF that return the number you have entered
                    <asp:TextBox ID="txtNumber" TextMode="Number" runat="server" ></asp:TextBox>
                    <asp:Button OnClick="InvokeWcf_Click" Text="Invoke Wcf" runat="server" />
                    <asp:Label ID="lblInvokeWcfResponse" runat="server" />
                </p>
            </section>
        </div>
    </main>

</asp:Content>
