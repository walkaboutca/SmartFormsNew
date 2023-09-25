<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="OpenAuthProviders.ascx.vb" Inherits="SmartForms.OpenAuthProviders" %>

<div id="socialLoginList">
    <h4>CONNECT</h4>
    <hr />
    <asp:ListView runat="server" ID="providerDetails" ItemType="System.String"
        SelectMethod="GetProviderNames" ViewStateMode="Disabled">
        <ItemTemplate>
            <p>
                <button type="submit" class="btn btn-default" name="provider" value="<%#: Item %>"
                    title="Log in using your <%#: Item %> account.">
                    <%#: Item %>
                </button>
            </p>
        </ItemTemplate>
        <EmptyDataTemplate>
            <div>
                <p>Smart Form will include a road map item to use Board (CREA) SSO for access but will retain Microsoft Identity and OWIN security for individual users.</p>
            </div>
        </EmptyDataTemplate>
    </asp:ListView>
</div>
