<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Default.aspx.cs" Inherits="_1dv406_2_2_aventyrliga_kontakter.Default" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Äventyrliga kontakter</title>
    <link href="~/Style.css" rel="stylesheet" />
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
</head>
<body>
    <form id="Myform" runat="server">
        <div id="maincontainer">
            <h1>Äventyrliga kontakter
            </h1>

            <div id="Status">
                <p>
                    <%-- Ikon och plats för statusmeddelandet --%>
                    <asp:Image ID="StatusImage" runat="server" ImageUrl="~/Images/OK.png" Visible="false"/>
                    <asp:Label ID="StatusLabel" runat="server" Text="" Visible="false"></asp:Label>
                </p>
                <p>
                    <%-- Valideringsfelmeddelanden --%>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                        HeaderText="Fel inträffade! Åtgärda felen och försök igen." />
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server"
                        HeaderText="Fel inträffade! Åtgärda felen och försök igen." 
                         ValidationGroup="InsertGroup" ShowModelStateErrors="false"/>
                    <asp:ValidationSummary ID="ValidationSummary3" runat="server"
                        HeaderText="Fel inträffade! Åtgärda felen och försök igen." 
                         ValidationGroup="EditGroup" ShowModelStateErrors="false"/>                  
                </p>
            </div>
            <%-- Visar alla kontakter i en lista --%>
            <div id="ListViewWrapper">
                <asp:ListView ID="ContactListView" runat="server"
                    ItemType="_1dv406_2_2_aventyrliga_kontakter.Model.Contact"
                    SelectMethod="ContactListView_GetDataPageWise"
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
                                <th>Alternativ
                                </th>
                                <th></th>
                            </tr>
                            <%-- Platshållare för nya rader --%>
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                        </table>
                        <asp:DataPager ID="DataPagerContactList" runat="server"
                            PagedControlID="ContactListView" PageSize="20">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button"
                                    ShowFirstPageButton="true"
                                    ShowNextPageButton="false"
                                    ButtonCssClass="ButtonClass"
                                    ShowPreviousPageButton="true" />
                                <asp:NumericPagerField
                                    CurrentPageLabelCssClass="CurrentPageLabelClass"
                                    NextPreviousButtonCssClass="NextPreviousButtonClass"
                                    NumericButtonCssClass="NumericButtonClass"
                                    ButtonType="Link"
                                    RenderNonBreakingSpacesBetweenControls="true" />
                                <asp:NextPreviousPagerField ButtonType="Button"
                                    ShowLastPageButton="true"
                                    ShowNextPageButton="true"
                                    ButtonCssClass="ButtonClass"
                                    ShowPreviousPageButton="false" />
                            </Fields>
                        </asp:DataPager>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="ItemFNameLabel" runat="server" Text='<%#: Item.FirstName %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="ItemLNameLabel" runat="server" Text='<%#: Item.LastName %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="ItemEmailLabel" runat="server" Text='<%#: Item.EmailAddress %>'></asp:Label>
                            </td>
                            <td>
                                <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="Ta bort" CausesValidation="false"
                                    OnClientClick='<%# String.Format("return confirm(\"Vill du verkligen ta bort {0} {1} från kontaktlistan?\")", Item.FirstName, Item.LastName) %>' CssClass="linkbtn" />
                                <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Redigera" CausesValidation="false" CssClass="linkbtn" />
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
                                <%-- Inputfält för förnamn --%>
                                <asp:TextBox ID="FNameTextBox" runat="server" Text='<%#: BindItem.FirstName %>'
                                    CssClass="textbox" Width="180" MaxLength="50"></asp:TextBox>
                                <%-- Validering av e-post --%>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="FNameTextBox" ErrorMessage="Förnamn måste anges"
                                     ValidationGroup="InsertGroup" Display="None"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <%-- Inputfält för efternamn --%>
                                <asp:TextBox ID="LNameTextBox" runat="server" Text='<%#: BindItem.LastName %>'
                                    CssClass="textbox" Width="180" MaxLength="50"></asp:TextBox>
                                <%-- Validering av efternamn --%>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="LNameTextBox" ErrorMessage="Efternamn måste anges."
                                    ValidationGroup="InsertGroup" Display="None"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <%-- Inputfält för epostadress --%>
                                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%#: BindItem.EmailAddress %>'
                                    CssClass="textbox" Width="180" MaxLength="50"></asp:TextBox>
                                <%-- Validering av epostadress --%>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="EmailTextBox" ErrorMessage="E-postadress måste anges"
                                    ValidationGroup="InsertGroup" Display="None"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                    ControlToValidate="EmailTextBox" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                                    ErrorMessage="E-postadressen är inte giltig" ValidationGroup="InsertGroup" Display="None">
                                </asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <%-- Kommandoknappar för att lägga till ny kontakt och avbryta inmatningen --%>
                                <asp:LinkButton runat="server" CommandName="Insert" Text="Lägg till" CssClass="linkbtn" ValidationGroup="InsertGroup" />
                                <asp:LinkButton runat="server" CommandName="Cancel" Text="Rensa" CausesValidation="false" CssClass="linkbtn" ValidationGroup="InsertGroup" />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <EditItemTemplate>
                        <tr>
                            <td>
                                <%-- Inputfält för förnamn --%>
                                <asp:TextBox ID="EditFNameTextBox" runat="server" Text='<%#: BindItem.FirstName %>' 
                                    CssClass="textbox" Width="180" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="EditFNameTextBox" ErrorMessage="Efternamn måste anges"
                                    ValidationGroup="EditGroup" Display="None"></asp:RequiredFieldValidator>
                            </td>
                            </td>
                            <td>
                                <%-- Inputfält för efternamn --%>
                                <asp:TextBox ID="EditLNameTextBox" runat="server" Text='<%#: BindItem.LastName %>' 
                                    CssClass="textbox" Width="180" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ControlToValidate="EditLNameTextBox" ErrorMessage="Efternamn måste anges"
                                    ValidationGroup="EditGroup" Display="None"></asp:RequiredFieldValidator>
                            </td>
                            </td>
                            <td>
                                <%-- Validering av epostadress --%>
                                <asp:TextBox ID="EditEmailTextBox" runat="server" Text='<%#: BindItem.EmailAddress %>' 
                                    CssClass="textbox" Width="180" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                    ControlToValidate="EditEmailTextBox" ErrorMessage="E-postadress måste anges"
                                    ValidationGroup="EditGroup" Display="None"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                    ControlToValidate="EditEmailTextBox" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                                    ErrorMessage="E-postadressen är inte giltig" ValidationGroup="EditGroup" Display="None">
                                </asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <%-- Kommandoknappar för att redigera kontakt och ta bort kontakt --%>
                                <asp:LinkButton runat="server" CommandName="Update" Text="Spara" CssClass="linkbtn" ValidationGroup="EditGroup"/>
                                <asp:LinkButton runat="server" CommandName="Cancel" Text="Avbryt" CausesValidation="false" CssClass="linkbtn" ValidationGroup="EditGroup" />
                            </td>
                        </tr>
                    </EditItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </form>     
	<%-- Tonar ut statusmeddelande vid lyckad uppladdning --%>
    <script>
        $(document).ready(function () {
            var $statusText = $("#StatusLabel");
            var $statusImg = $("#StatusImage");
            if ($statusText.length || $statusImg.length) {
                setTimeout(function () {
                    $statusText.fadeOut();
                    $statusImg.fadeOut();
                }, 2500);
            }
        });
    </script>
</body>
</html>
