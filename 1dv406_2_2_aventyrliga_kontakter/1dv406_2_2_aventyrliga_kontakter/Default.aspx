﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_1dv406_2_2_aventyrliga_kontakter.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Äventyrliga kontakter</title>
    <link href="~/Style.css" rel="stylesheet" />
</head>
<body>
    <form id="Myform" runat="server">
        <div id="maincontainer">
            <h1>
                Äventyrliga kontakter
            </h1>
            <p>
                <%-- Valideringsfelmeddelanden --%>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    HeaderText="Fel inträffade! Åtgärda felen och försök igen." />
            </p>
            <div id="ListViewWrapper">
                <asp:ListView ID="ContactListView" runat="server"
                    ItemType="_1dv406_2_2_aventyrliga_kontakter.Model.Contact"
                    SelectMethod="ContactListView_GetData"
                    InsertMethod="ContactListView_InsertItem"
                    UpdateMethod="ContactListView_UpdateItem"
                    DeleteMethod="ContactListView_DeleteItem"
                    DataKeyNames="ContactID"
                    InsertItemPosition="FirstItem">
                    <LayoutTemplate>
                        <table>
                            <tr>
                                <th>Förnamn
                                </th>
                                <th>Efternamn
                                </th>
                                <th>Epostadress
                                </th>
                                <th></th>
                                <th></th>
                            </tr>
                            <%-- Platshållare för nya rader --%>
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="ItemFNameLabel" runat="server" Text='<%# Item.FirstName %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="ItemLNameLabel" runat="server" Text='<%# Item.LastName %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="ItemEmailLabel" runat="server" Text='<%# Item.EmailAdress %>'></asp:Label>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Delete" Text="Ta bort" CausesValidation="false"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Edit" Text="Redigera" CausesValidation="false"></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <%-- Detta visas om kontaktuppgifter saknas i databasen --%>
                        <table>
                            <tr>
                                <td>Kontaktuppgifter saknas.
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# BindItem.FirstName %>'></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# BindItem.LastName %>'></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# BindItem.EmailAdress %>'></asp:TextBox>
                            </td>
                            <td>
                                <%-- Kommandoknappar för att spara ny kontakt och avbryta inmatningen --%>
                                <asp:LinkButton runat="server" CommandName="Insert" Text="Spara"></asp:LinkButton>
                                <asp:LinkButton runat="server" CommandName="Cancel" Text="Avbryt" CausesValidation="false"></asp:LinkButton>
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <EditItemTemplate>
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# BindItem.FirstName %>'></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# BindItem.LastName %>'></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# BindItem.EmailAdress %>'></asp:TextBox>
                            </td>
                            <td>
                                <%-- Kommandoknappar för att redigera kontakt och ta bort kontakt --%>
                                <asp:LinkButton runat="server" CommandName="Update" Text="Spara"></asp:LinkButton>
                                <asp:LinkButton runat="server" CommandName="Cancel" Text="Avbryt" CausesValidation="false"></asp:LinkButton>
                            </td>
                        </tr>
                    </EditItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </form>
</body>
</html>
