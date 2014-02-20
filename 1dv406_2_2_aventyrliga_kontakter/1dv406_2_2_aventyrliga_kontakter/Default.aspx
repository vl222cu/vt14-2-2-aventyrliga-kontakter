<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_1dv406_2_2_aventyrliga_kontakter.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Äventyrliga kontakter</title>
    <link href="~/Style.css" rel="stylesheet" />
</head>
<body>
    <form id="Myform" runat="server">
        <div id="maincontainer">
            <h1>Äventyrliga kontakter
            </h1>
            <div>
                <asp:Button ID="SendButton" runat="server" Text="Ny kontakt" OnClick="SendButton_Click" />
            </div>
            <%-- Kontaktabell --%>
            <table class="contacttable">
                <tr>
                    <th>
                        <asp:Label ID="FNameLabel" runat="server" Text="Förnamn"></asp:Label>
                    </th>
                    <th>
                        <asp:Label ID="LNameLabel" runat="server" Text="Efternamn"></asp:Label>
                    </th>
                    <th>
                        <asp:Label ID="EmailLabel" runat="server" Text="E-post"></asp:Label>
                    </th>
                </tr>
                <tr>
                    <td>
                        <%-- Förnamninputfält --%>
                        <asp:TextBox ID="FNameTextBox" runat="server" MaxLength="50" Width="250"></asp:TextBox>
                        <%-- Validering av e-post --%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="FNameTextBox" ErrorMessage="Förnamn måste anges"
                            Display="None"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <%-- Efternamninputfält --%>
                        <asp:TextBox ID="LNameTextBox" runat="server" MaxLength="50" Width="250"></asp:TextBox>
                        <%-- Validering av e-post --%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="LNameTextBox" ErrorMessage="Efternamn måste anges"
                            Display="None"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <%-- Epostinputfält --%>
                        <asp:TextBox ID="EmailTextBox" runat="server" MaxLength="50" Width="250"></asp:TextBox>
                        <%-- Validering av e-post --%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="EmailTextBox" ErrorMessage="E-postadress måste anges"
                            Display="None"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="EmailTextBox" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                            ErrorMessage="E-postadressen är inte giltig" Display="None">
                        </asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
            <p>
                <%-- Valideringsfelmeddelanden --%>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    HeaderText="Fel inträffade! Åtgärda felen och försök igen." />
            </p>
            <div id="ListViewWrapper">
                <asp:ListView ID="ContactListView" runat="server"
                    ItemType="_1dv406_2_2_aventyrliga_kontakter.Model.Contact"
                    SelectMethod="ContactListView_GetData"
                    DataKeyNames="ContactID">
                    <ItemTemplate>
                        <table>
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
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </form>
</body>
</html>
