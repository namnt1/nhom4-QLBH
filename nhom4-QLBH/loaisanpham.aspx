<%@ Page Title="Loại sản phẩm" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" >
    <div class="featured">
    <div class="container">
        <div class="row">
            <div class="feature-grids">
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="id_lsp" DataSourceID="SqlDataSource2">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" Width="20%" Height="40px" />
            <Fields>
                <asp:BoundField DataField="id_lsp" HeaderText="id_lsp" ReadOnly="True" SortExpression="id_lsp" />
                <asp:BoundField DataField="ten_lsp" HeaderText="ten_lsp" SortExpression="ten_lsp" />
                <asp:BoundField DataField="id_muc" HeaderText="id_muc" SortExpression="id_muc" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM [loai_sam_pham] WHERE [id_lsp] = @id_lsp" InsertCommand="INSERT INTO [loai_sam_pham] ([id_lsp], [ten_lsp], [id_muc]) VALUES (@id_lsp, @ten_lsp, @id_muc)" SelectCommand="SELECT [id_lsp], [ten_lsp], [id_muc] FROM [loai_sam_pham]" UpdateCommand="UPDATE [loai_sam_pham] SET [ten_lsp] = @ten_lsp, [id_muc] = @id_muc WHERE [id_lsp] = @id_lsp">
                    <DeleteParameters>
                        <asp:Parameter Name="id_lsp" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id_lsp" Type="Int32" />
                        <asp:Parameter Name="ten_lsp" Type="String" />
                        <asp:Parameter Name="id_muc" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ten_lsp" Type="String" />
                        <asp:Parameter Name="id_muc" Type="Int32" />
                        <asp:Parameter Name="id_lsp" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [loai_sam_pham] WHERE [id_lsp] = @original_id_lsp AND [ten_lsp] = @original_ten_lsp AND (([id_muc] = @original_id_muc) OR ([id_muc] IS NULL AND @original_id_muc IS NULL))" InsertCommand="INSERT INTO [loai_sam_pham] ([id_lsp], [ten_lsp], [id_muc]) VALUES (@id_lsp, @ten_lsp, @id_muc)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id_lsp], [ten_lsp], [id_muc] FROM [loai_sam_pham]" UpdateCommand="UPDATE [loai_sam_pham] SET [ten_lsp] = @ten_lsp, [id_muc] = @id_muc WHERE [id_lsp] = @original_id_lsp AND [ten_lsp] = @original_ten_lsp AND (([id_muc] = @original_id_muc) OR ([id_muc] IS NULL AND @original_id_muc IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id_lsp" Type="Int32" />
                <asp:Parameter Name="original_ten_lsp" Type="String" />
                <asp:Parameter Name="original_id_muc" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_lsp" Type="Int32" />
                <asp:Parameter Name="ten_lsp" Type="String" />
                <asp:Parameter Name="id_muc" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ten_lsp" Type="String" />
                <asp:Parameter Name="id_muc" Type="Int32" />
                <asp:Parameter Name="original_id_lsp" Type="Int32" />
                <asp:Parameter Name="original_ten_lsp" Type="String" />
                <asp:Parameter Name="original_id_muc" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
            </div>
        </div>
    </div>
</asp:Content>
